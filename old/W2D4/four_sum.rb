def two_sum?(arr, target)
  value_hash = Hash.new

  arr.each do |num1|
    diff = target - num1
    return true if value_hash[diff] = true
  end
end
