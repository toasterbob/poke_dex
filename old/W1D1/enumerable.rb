require 'byebug'

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      proc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    final_arr = []
    i = 0
  #   while i < self.length
  #     if proc.call(self[i])
  #       final_arr << self[i]
  #     end
  #     i += 1
  #   end
  #   final_arr
  # end
    self.my_each do |el|
      if proc.call(el)
        final_arr << el
      end
    end
    final_arr
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |element|
      unless proc.call(element)
        rejected << element
      end
    end
    rejected
  end

  def my_all?(&prc)
    self.my_each do |element|
      return false unless proc.call(element)
    end
    true
  end

  def my_any?(&prc)
    self.my_each do |element|
      return true if proc.call(element)
    end
    false
  end

  def my_flatten
    flat_array = []
    self.each do |element|
      unless element.is_a?(Array)
        flat_array << element
      else
        flat_array += element.my_flatten
      end
    end
    flat_array
  end

  def my_zip(*arg)
    others = arg #array of arrays
    final_arr = []

    self.length.times.with_index do |idx1|
      temp_arr = []
      temp_arr << self[idx1]
      others.length.times.with_index do |idx2|
        temp_arr << others[idx2][idx1]
      end
      final_arr << temp_arr
    end

    final_arr
  end

  def my_rotate(reps = 1)
    if reps > 0
      reps.times do

        temp = self.shift
        self << temp
      end
    elsif reps == 0
      return self
    else
      reps = -1 * reps
      reps.times do
        temp = self.pop
        self.unshift(temp)
      end
    end
    self
  end

  def my_join(sep=nil)
    final_string = self.first
    self[1..-1].each do |element|
      if sep
        final_string += (sep + element)
      else
        final_string += element
      end
    end
    final_string
  end

  def my_reverse
    reversed_array = []
    i = self.length - 1
    while i >= 0
      reversed_array << self[i]
      i -= 1
    end
    reversed_array
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse
