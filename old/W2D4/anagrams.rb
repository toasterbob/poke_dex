def first_anagram?(first_string, second_string) #n!
  first_anagrams = first_string.chars.permutation.map(&:join)

  first_anagrams.include?(second_string)
end

def second_anagram?(first_string, second_string) #n ** 2
  first_chars = first_string.chars
  second_chars = second_string.chars

  until first_chars.empty?
    location = second_chars.find_index(first_chars.pop)
    return false unless location
    second_chars.delete_at(location)
  end

  second_chars.empty?
end

def third_anagram?(first_string, second_string) #n(log(n))
  first_sorted = mergesort(first_string.chars)
  second_sorted = mergesort(second_string.chars)

  first_sorted == second_sorted
end

def mergesort(array)
  return array if array.length <= 1

  mid = array.length / 2

  left = array.take(mid)
  right = array.drop(mid)

  sorted_left = mergesort(left)
  sorted_right = mergesort(right)

  result = []

  until sorted_right.empty? || sorted_left.empty?
    if sorted_left.first <= sorted_right.first
      result << sorted_left.shift
    else
      result << sorted_right.shift
    end
  end

  result + sorted_right + sorted_left
end

def fourth_anagram?(first_string, second_string)
  count_hash = Hash.new(0)

  first_string.each_char do |char|
    count_hash[char] += 1
  end

  second_string.each_char do |char|
    count_hash[char] -= 1
  end

  count_hash.values.all? { |value| value == 0 }
end

if __FILE__ == $0
  p fourth_anagram?("gizmo", "sally")
  p fourth_anagram?("elvis", "lives")
end
