def merge(arr1, arr2)
  comb_arr = []
  while true
    return comb_arr + arr2 if arr1.empty?
    return comb_arr + arr1 if arr2.empty?

    if arr1[0] < arr2[0]
      comb_arr << arr1[0]
      arr1.delete_at(0)
    else
      comb_arr << arr2[0]
      arr2.delete_at(0)
    end
  end

  comb_arr
end

#p merge([27,38], [3,43])

def merge_sort(arr)
  return arr if arr.size <= 1
  mid_index = arr.size / 2
  left = arr[0...mid_index]
  right = arr[mid_index..-1]
  merge(merge_sort(left), merge_sort(right))
end

#arr = [38, 27 ,43, 3, 9, 82, 10]
arr = [2, 3, 1]
p merge_sort(arr)
