require 'byebug'
def permutations(arr)

  results = []
  return [arr] if arr.size <=1
  arr.each do |num|
    rem_arr = arr.reject{|x| x == num}
    permutations(rem_arr).each do |a|
      results << ([num] + a).flatten
    end
  end

  results
end

p permutations([1,2,3])
