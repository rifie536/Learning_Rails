#!/usr/bin/env ruby
# Day 4: Example 1 - sendメソッド

puts "=" * 50
puts "Example 1: sendメソッド"
puts "=" * 50

# 通常のメソッド呼び出し
class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    return nil if b == 0
    a / b
  end
end

puts "\n--- 通常のメソッド呼び出し ---"
calc = Calculator.new
puts "10 + 5 = #{calc.add(10, 5)}"
puts "10 - 5 = #{calc.subtract(10, 5)}"
puts "10 * 5 = #{calc.multiply(10, 5)}"
puts "10 / 5 = #{calc.divide(10, 5)}"

puts "\n--- sendを使った呼び出し ---"
# sendメソッドでメソッドを呼び出す
puts "10 + 5 = #{calc.send(:add, 10, 5)}"
puts "10 - 5 = #{calc.send(:subtract, 10, 5)}"

# メソッド名を文字列で指定
method_name = "multiply"
puts "10 * 5 = #{calc.send(method_name, 10, 5)}"

puts "\n" + "=" * 50
puts "Example 1-2: sendで動的なメソッド呼び出し"
puts "=" * 50

# ユーザー入力やデータベースから動的にメソッドを選択
operations = ["add", "subtract", "multiply", "divide"]

puts "\n--- 動的にメソッドを呼び出し ---"
operations.each do |op|
  result = calc.send(op.to_sym, 20, 4)
  puts "#{op}(20, 4) = #{result}"
end

puts "\n" + "=" * 50
puts "Example 1-3: sendでオブジェクトのメソッドを呼び出し"
puts "=" * 50

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    "こんにちは、#{@name}です"
  end

  def birthday
    @age += 1
    "#{@name}は#{@age}歳になりました"
  end
end

puts "\n--- Personクラスでsendを使用 ---"
person = Person.new("太郎", 25)

# attr_accessorで生成されたメソッドをsendで呼び出し
puts person.send(:name)
puts person.send(:age)

# インスタンスメソッドをsendで呼び出し
puts person.send(:greet)
puts person.send(:birthday)

puts "\n" + "=" * 50
puts "Example 1-4: sendでコントローラーのアクションを呼び出し（Rails風）"
puts "=" * 50

class Controller
  def index
    "全件表示"
  end

  def show
    "詳細表示"
  end

  def create
    "作成"
  end

  def update
    "更新"
  end

  def delete
    "削除"
  end
end

puts "\n--- Rails風のルーティング ---"
controller = Controller.new
routes = {
  "index" => [],
  "show" => [],
  "create" => [],
  "update" => [],
  "delete" => []
}

routes.each do |action, _args|
  result = controller.send(action.to_sym)
  puts "#{action}: #{result}"
end

puts "\n" + "=" * 50
puts "Example 1-5: sendでプライベートメソッドを呼び出す"
puts "=" * 50

class Secret
  def public_method
    "これは公開メソッドです"
  end

  private

  def private_method
    "これはプライベートメソッドです"
  end
end

puts "\n--- プライベートメソッド ---"
secret = Secret.new

puts secret.public_method

# 通常は呼び出しできない
begin
  secret.private_method
rescue NoMethodError => e
  puts "エラー: プライベートメソッドは呼び出せません"
end

# sendを使えば呼び出せる（セキュリティの穴）
puts "\n--- sendでプライベートメソッドを呼び出し ---"
puts secret.send(:private_method)

puts "\n" + "=" * 50
puts "Example 1-6: sendでクラスメソッドを呼び出す"
puts "=" * 50

class User
  def self.all
    "すべてのユーザー"
  end

  def self.find(id)
    "ユーザーID: #{id}"
  end

  def self.count
    100
  end
end

puts "\n--- クラスメソッドへのsend ---"
puts User.send(:all)
puts User.send(:find, 5)
puts "ユーザー数: #{User.send(:count)}"

puts "\n" + "=" * 50
puts "Example 1: 終了"
puts "=" * 50
