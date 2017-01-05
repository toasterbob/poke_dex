# values = File.foreach("dictionary.txt") do |line|
#   p line.chomp # ...
# end

word_arr = File.readlines("dictionary.txt")
values = word_arr.map(&:chomp)
keys = values.map(&:to_sym)
hash = keys.zip(values).to_h

p hash 
