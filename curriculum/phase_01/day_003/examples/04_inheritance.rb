#!/usr/bin/env ruby
# Day 3: Example 4 - 継承

puts "=" * 50
puts "Example 4: 継承"
puts "=" * 50

# 親クラス
class Animal
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    puts "#{@name}は何か言った"
  end

  def info
    puts "名前: #{@name}, 年齢: #{@age}歳"
  end
end

# 子クラス
class Dog < Animal
  # Dogクラスはanimalクラスのすべてのメソッドを継承
  def speak
    puts "#{@name}は: ワンワン！"
  end

  def fetch
    puts "#{@name}はボールを取ってきた"
  end
end

class Cat < Animal
  def speak
    puts "#{@name}は: ニャー"
  end

  def scratch
    puts "#{@name}は爪を研いだ"
  end
end

puts "\n--- 継承の例 ---"
dog = Dog.new("ポチ", 3)
dog.info
dog.speak
dog.fetch

puts "\n"
cat = Cat.new("ミケ", 2)
cat.info
cat.speak
cat.scratch

puts "\n" + "=" * 50
puts "Example 4-2: superキーワード"
puts "=" * 50

class Vehicle
  attr_accessor :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def start
    puts "#{@brand} #{@model}がスタートした"
  end

  def stop
    puts "#{@brand} #{@model}が停止した"
  end
end

class Car < Vehicle
  attr_accessor :doors

  def initialize(brand, model, doors)
    super(brand, model)  # 親クラスのinitializeを呼ぶ
    @doors = doors
  end

  def start
    super  # 親クラスのstartを呼ぶ
    puts "エンジン音: ブルルル"
  end

  def info
    puts "ブランド: #{@brand}, モデル: #{@model}, ドア数: #{@doors}"
  end
end

puts "\n--- Car クラス ---"
car = Car.new("トヨタ", "プリウス", 4)
car.info
car.start
car.stop

puts "\n" + "=" * 50
puts "Example 4-3: メソッドのオーバーライド"
puts "=" * 50

class Shape
  def area
    0
  end

  def perimeter
    0
  end

  def describe
    puts "これは図形です"
  end
end

class Rectangle < Shape
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end

  def perimeter
    2 * (@width + @height)
  end

  def describe
    puts "これは長方形です"
    puts "幅: #{@width}, 高さ: #{@height}"
  end
end

class Circle < Shape
  attr_accessor :radius

  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius ** 2
  end

  def perimeter
    2 * Math::PI * @radius
  end

  def describe
    puts "これは円です"
    puts "半径: #{@radius}"
  end
end

puts "\n--- Shape ---"
shape = Shape.new
shape.describe

puts "\n--- Rectangle ---"
rect = Rectangle.new(10, 5)
rect.describe
puts "面積: #{rect.area}"
puts "周囲: #{rect.perimeter.round(2)}"

puts "\n--- Circle ---"
circle = Circle.new(7)
circle.describe
puts "面積: #{circle.area.round(2)}"
puts "周囲: #{circle.perimeter.round(2)}"

puts "\n" + "=" * 50
puts "Example 4-4: 多重レベルの継承"
puts "=" * 50

class LivingThing
  def alive?
    true
  end
end

class Mammal < LivingThing
  def warm_blooded?
    true
  end
end

class Primate < Mammal
  def use_tools?
    true
  end
end

class Human < Primate
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    puts "#{@name}は話す"
  end

  def info
    puts "名前: #{@name}"
    puts "生きている? #{alive?}"
    puts "温血動物? #{warm_blooded?}"
    puts "道具を使える? #{use_tools?}"
  end
end

puts "\n--- 多重継承の例 ---"
person = Human.new("太郎")
person.info

puts "\n" + "=" * 50
puts "Example 4-5: 継承階層"
puts "=" * 50

class Employee
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def work
    puts "#{@name}は働いている"
  end

  def get_salary
    puts "給料: ¥#{@salary}"
  end
end

class Manager < Employee
  def manage_team
    puts "#{@name}はチームを管理している"
  end
end

class Developer < Employee
  attr_accessor :language

  def initialize(name, salary, language)
    super(name, salary)
    @language = language
  end

  def code
    puts "#{@name}は#{@language}でコーディングしている"
  end
end

class CTO < Manager
  def set_strategy
    puts "#{@name}は技術戦略を立てている"
  end
end

puts "\n--- 従業員 ---"
emp = Employee.new("太郎", 300000)
emp.work
emp.get_salary

puts "\n--- エンジニア ---"
dev = Developer.new("花子", 400000, "Ruby")
dev.work
dev.code
dev.get_salary

puts "\n--- マネージャー ---"
mgr = Manager.new("次郎", 500000)
mgr.work
mgr.manage_team
mgr.get_salary

puts "\n--- CTO ---"
cto = CTO.new("三郎", 700000)
cto.work
cto.manage_team
cto.set_strategy
cto.get_salary

puts "\n" + "=" * 50
puts "Example 4-6: クラスの確認メソッド"
puts "=" * 50

puts "\n--- クラスの確認 ---"
puts "dog.class: #{dog.class}"
puts "dog.is_a?(Dog): #{dog.is_a?(Dog)}"
puts "dog.is_a?(Animal): #{dog.is_a?(Animal)}"
puts "dog.is_a?(Cat): #{dog.is_a?(Cat)}"

puts "\n"
puts "rect.class: #{rect.class}"
puts "rect.is_a?(Rectangle): #{rect.is_a?(Rectangle)}"
puts "rect.is_a?(Shape): #{rect.is_a?(Shape)}"

puts "\n--- 継承チェーン ---"
puts "Developer < Employee: #{Developer < Employee}"
puts "Developer < Manager: #{Developer < Manager}"

puts "\n" + "=" * 50
puts "Example 4: 終了"
puts "=" * 50
