class Array
  def deep_dup
    map do |el|
      unless el.is_a? Array
        el.is_a?(Integer) ? el : el.dup
      else
        el.deep_dup
      end
    end
  end
end
##############################################
robot_parts = [
  ["nuts", "bolts", 45],
  ["capacitors", "resistors", 22]
]

##############################################
robot_parts_copy = robot_parts.dup

# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# wtf?
p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

##############################################
my_parts = [
  ["nuts", "bolts", 45],
  ["capacitors", "resistors", 22]
]

my_parts_copy = my_parts.deep_dup

# shouldn't modify my_parts
my_parts_copy[1] << "LEDs"
# wtf?
p my_parts[1] # => ["capacitors", "resistors", "inductors"]

##############################################

test2 = [1, [2], [3, [4]]]
test2_copy = test2.deep_dup
test2_copy[2][1] << 5
p test2
