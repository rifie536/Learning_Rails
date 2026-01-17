#!/usr/bin/env ruby
# Day 3: Exercise 3 - クラス変数を使った会社管理システム

class Employee
  @@employee_count = 0
  @@total_salary = 0
  @@employees = []

  attr_accessor :name, :department, :salary

  def initialize(name, department, salary)
    @name = name
    @department = department
    @salary = salary
    @@employee_count += 1
    @@total_salary += salary
    @@employees << self
  end

  def self.total_employees
    @@employee_count
  end

  def self.average_salary
    return 0 if @@employee_count == 0
    @@total_salary.to_f / @@employee_count
  end

  def self.raise_all_salary(percent)
    raise_amount = @@total_salary * percent / 100
    @@total_salary += raise_amount

    @@employees.each do |emp|
      emp.salary = (emp.salary * (1 + percent / 100.0)).round
    end
  end

  def display
    puts "名前: #{@name}, 部署: #{@department}, 給与: ¥#{@salary}"
  end
end

# テスト
if __FILE__ == $0
  emp1 = Employee.new("太郎", "営業", 300000)
  emp2 = Employee.new("花子", "企画", 350000)
  emp3 = Employee.new("次郎", "技術", 400000)

  puts "--- 初期状態 ---"
  puts "従業員数: #{Employee.total_employees}"
  puts "平均給与: ¥#{Employee.average_salary.round}"

  puts "\n--- 従業員一覧 ---"
  emp1.display
  emp2.display
  emp3.display

  puts "\n--- 10%昇給 ---"
  Employee.raise_all_salary(10)

  puts "\n--- 昇給後 ---"
  puts "平均給与: ¥#{Employee.average_salary.round}"
  puts "\n従業員一覧:"
  emp1.display
  emp2.display
  emp3.display
end
