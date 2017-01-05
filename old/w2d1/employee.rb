require "byebug"
class Employee
  attr_accessor :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss)
    @employees = []
    @name, @title, @salary, @boss = name, title, salary, boss
    @boss.employees << self unless @boss.nil?
  end

  def bonus(multiplier)
    @salary*multiplier
  end
end

class Manager < Employee

  def initialize(name,title,salary,boss)
    super
  end

  def bonus(multiplier)
    @total_salary = 0
    @new_employees = @employees
    until @new_employees.empty?
      @new_employees += @new_employees.first.employees if @new_employees.first.class == Manager
      @total_salary += @new_employees.first.salary
      @new_employees.shift
    end
    @total_salary*multiplier


  end


end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
