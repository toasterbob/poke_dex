require 'byebug'

def my_min_phase_1(arr) #n ** 2
  arr.each do |el|
    return el if arr.all? do |el2|
      el2 >= el
    end
  end
end

def my_min_phase_2(arr) #n
  minimum = arr.first

  arr.each do |el|
    minimum = el if el < minimum
  end
  minimum
end

def largest_cont_subsum_phase_1(arr) #n ** 3
  subsums = []

  arr.each_index do |idx1|
    (idx1..(arr.length - 1)).each do |idx2|
      subsums << arr[idx1..idx2]
    end
  end

  maxsums = subsums.first.inject(:+)
  #maxsub = subsums.first

  subsums.each do |subs|
    if subs.inject(:+) > maxsums
      maxsums = subs.inject(:+)
      #maxsub = subs
    end
  end

  maxsums
end

def largest_cont_subsum_phase_2(arr)
  max_el = arr.max
  return max_el if max_el < 0
  curr_max_sum = arr.first
  curr_sum = 0

  arr.each do |el|
    if el >= 0
      curr_sum += el
      curr_max_sum = curr_sum if curr_sum > curr_max_sum
      next
    else
      curr_sum += el
      curr_sum = 0 if curr_sum < 0
    end
  end

  curr_max_sum
end

list = [5, 3, -7]
p largest_cont_subsum_phase_2(list)

list = [2, 3, -6, 7, -6, 7]
#byebug
p largest_cont_subsum_phase_2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_cont_subsum_phase_2(list) # => -1 (from [-1])
