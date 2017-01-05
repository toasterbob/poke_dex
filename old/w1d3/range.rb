def range(first, last)
  #base case
  return [first, last] if last - first == 1
  return [first] if last == first
  return [] if first > last

  #step
  [first] + range(first + 1, last - 1) + [last]

end


p range(1,10)
p range(1,9)
p range(12, 9)

def range2(first, last)
  #base case
  return [first, last] if last - first == 1
  return [first] if last == first
  return [] if first > last

  #step
  range(first, last - 1) + [last]

end

p range2(1,10)
p range2(1,9)
p range2(12, 9)

def range_iter(first, last)
  solution = []
  num = first

  while num <= last
    solution << num
    num += 1
  end

  solution
end

p range_iter(1,10)
p range_iter(1,9)
p range_iter(12, 9)
