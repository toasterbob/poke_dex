class MyStack

  def initialize
    @store = []
    @stack_max = nil
    @max_pointer_hash = Hash.new { [] }
    @stack_min = nil
    @min_pointer_hash = Hash.new { [] }
  end

  def pop
    el = @store.pop
    @stack_max = @max_pointer_hash[el].pop if @stack_max == el
    @stack_min = @min_pointer_hash[el].pop if @stack_min == el
    el
  end

  def push(el)
    @store.push(el)
    if @stack_max.nil? || el >= max
      @max_pointer_hash[el] += [max]
      @stack_max = el
    end
    if @stack_min.nil? || el <= min
      @min_pointer_hash[el] += [min]
      @stack_min = el
    end
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @stack_max
  end

  def min
    @stack_min
  end
end

class MinMaxStackQueue

  def initialize
    @in_store = MyStack.new
    @out_store = MyStack.new
  end

  def enqueue(el)
    @in_store.push(el)
  end

  def dequeue
    if @out_store.empty?
      until @in_store.empty?
        @out_store.push(@in_store.pop)
      end
    end

    @out_store.pop
  end

  def size
    @in_store.size + @out_store.size
  end

  def empty?
    @in_store.empty? && @out_store.empty?
  end

  def min
    return @out_store.min if @in_store.min.nil?
    return @in_store.min if @out_store.min.nil?
    [@in_store.min, @out_store.min].min
  end

  def max
    return @out_store.max if @in_store.max.nil?
    return @in_store.max if @out_store.max.nil?
    [@in_store.max, @out_store.max].max
  end

end

def windowed_max_range(arr, size) #n(window_size)
  loading_array = arr.dup

  window = MinMaxStackQueue.new
  size.times { window.enqueue(loading_array.shift) }

  current_max_range = window.max - window.min

  until loading_array.empty?
    window.enqueue(loading_array.shift)
    window.dequeue

    current_max_range = window.max - window.min if current_max_range < window.max - window.min
  end

  current_max_range
end

if __FILE__ == $0
  p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
