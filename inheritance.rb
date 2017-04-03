require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end


class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    total_sub_employee_salary = 0
    @employees.each do |employee_obj|
      total_sub_employee_salary += determine_sub_salary(employee_obj)
    end
    multiplier * total_sub_employee_salary
  end

  def determine_sub_salary(employee_obj)
    total_sub_salaries = employee_obj.salary
    if employee_obj.instance_variable_defined?(:@employees)
      employee_obj.employees.each do |employee|
        total_sub_salaries += determine_sub_salary(employee)
      end
      total_sub_salaries
    else
      employee_obj.salary
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "Founder", 5_000_000, nil, nil)
  darren = Manager.new("Darren", "TA Manager", 78_000, ned, nil)

  david = Manager.new("David", "TA", 10_000, darren, nil)
  shawna = Employee.new("Shawna", "TA", 12_000, darren)
  billy = Employee.new("Billy", "TAA", 100, david)
  ned.employees = [darren]
  darren.employees = [david, shawna]
  david.employees = [billy]
  p ned.bonus(1)
  p darren.bonus(1)
  p shawna.bonus(1)
  p david.bonus(3)

end
