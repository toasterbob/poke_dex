def bsearch(arr, target)

  if arr.size == 1
    if arr[0] == target
      return 0
    else
      return nil
    end
  end

  mid_index = arr.count / 2
  if arr.size.odd?
    mid = arr[mid_index]
    if target == mid
      return mid_index
    elsif target > mid
      new_arr = arr[(mid_index + 1)..-1]
      new_bsearch = bsearch(new_arr, target)
      new_bsearch.nil? ? nil : mid_index + new_bsearch + 1
    elsif target < mid
      new_arr = arr[0...mid_index]
      bsearch(new_arr, target)
    end
  elsif arr.size.even?
    mid = (arr[mid_index - 1] + arr[mid_index]) / 2.0
    if target > mid
      new_arr = arr[mid_index..-1]
      new_bsearch = bsearch(new_arr, target)
      new_bsearch.nil? ? nil : mid_index + new_bsearch
    elsif target < mid
      new_arr = arr[0...mid_index]
      bsearch(new_arr, target)
    end
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
