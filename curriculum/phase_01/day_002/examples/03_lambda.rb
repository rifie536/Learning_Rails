#!/usr/bin/env ruby
# frozen_string_literal: true

# =========================================
# Lambdaの基礎
# =========================================

puts "=" * 60
puts "1. Lambdaとは"
puts "=" * 60

# LambdaもProcの一種だが、いくつかの違いがある
# より関数的な振る舞いをする

puts "\n【例1: Lambdaの作成方法】"

# 方法1: lambda キーワード
my_lambda = lambda { puts "Hello from Lambda!" }

# 方法2: -> 記法（stabby lambda）
my_lambda2 = -> { puts "Hello from Lambda (stabby)!" }

puts "my_lambda のクラス: #{my_lambda.class}"
puts "lambda? メソッド: #{my_lambda.lambda?}"

puts "\n" + "=" * 60
puts "2. Lambdaの実行"
puts "=" * 60

puts "\n【例2: Lambdaの実行方法】"
my_lambda.call
my_lambda.()
my_lambda[]

puts "\n" + "=" * 60
puts "3. Lambdaに引数を渡す"
puts "=" * 60

puts "\n【例3: 引数ありのLambda】"
greet = ->(name) { puts "こんにちは、#{name}さん" }
greet.call("太郎")

puts "\n【例4: 複数の引数】"
add = ->(a, b) { a + b }
puts "10 + 20 = #{add.call(10, 20)}"

# 引数の型を明示的に書くこともできる（ただし実行時チェックはない）
multiply = ->(a, b) { a * b }
puts "5 * 3 = #{multiply.call(5, 3)}"

puts "\n" + "=" * 60
puts "4. Lambdaのブロック構文"
puts "=" * 60

puts "\n【例5: 複数行のLambda】"
complex_lambda = lambda do |name, age|
  puts "名前: #{name}"
  puts "年齢: #{age}"
  puts "成人: #{age >= 20 ? 'はい' : 'いいえ'}"
end

complex_lambda.call("太郎", 25)

puts "\n" + "=" * 60
puts "5. Lambdaを変数に保存して再利用"
puts "=" * 60

puts "\n【例6: Lambdaの再利用】"
to_uppercase = ->(str) { str.upcase }
to_lowercase = ->(str) { str.downcase }

text = "Hello World"
puts "元のテキスト: #{text}"
puts "大文字: #{to_uppercase.call(text)}"
puts "小文字: #{to_lowercase.call(text)}"

puts "\n" + "=" * 60
puts "6. Lambdaをメソッドに渡す"
puts "=" * 60

def execute_lambda(my_lambda, value)
  puts "Lambda実行前: #{value}"
  result = my_lambda.call(value)
  puts "Lambda実行後: #{result}"
  result
end

puts "\n【例7: Lambdaを引数として渡す】"
square = ->(x) { x ** 2 }
execute_lambda(square, 5)

puts "\n" + "=" * 60
puts "7. Lambdaの特徴: 引数の数に厳格"
puts "=" * 60

puts "\n【例8: 引数の数が合わない場合】"
strict_lambda = ->(a, b) { puts "a=#{a}, b=#{b}" }

begin
  strict_lambda.call(1, 2)  # OK
  puts "✓ 正常に実行"
rescue ArgumentError => e
  puts "✗ エラー: #{e.message}"
end

puts ""
begin
  strict_lambda.call(1)  # エラー
  puts "✓ 正常に実行"
rescue ArgumentError => e
  puts "✗ エラー: #{e.message}"
end

puts ""
begin
  strict_lambda.call(1, 2, 3)  # エラー
  puts "✓ 正常に実行"
rescue ArgumentError => e
  puts "✗ エラー: #{e.message}"
end

puts "\n" + "=" * 60
puts "8. デフォルト引数とキーワード引数"
puts "=" * 60

puts "\n【例9: デフォルト引数】"
greet_with_default = ->(name, greeting = "こんにちは") do
  puts "#{greeting}、#{name}さん"
end

greet_with_default.call("太郎")
greet_with_default.call("花子", "おはよう")

puts "\n【例10: キーワード引数】"
create_user = ->(name:, age:, email: nil) do
  puts "ユーザー作成:"
  puts "  名前: #{name}"
  puts "  年齢: #{age}"
  puts "  メール: #{email || '未設定'}"
end

create_user.call(name: "太郎", age: 25)
create_user.call(name: "花子", age: 30, email: "hanako@example.com")

puts "\n" + "=" * 60
puts "9. Railsでのラムダ使用例"
puts "=" * 60

puts "\n【例11: Railsのスコープイメージ】"
puts "class User < ApplicationRecord"
puts "  scope :active, -> { where(active: true) }"
puts "  scope :recent, -> { where('created_at > ?', 1.week.ago) }"
puts "  scope :by_role, ->(role) { where(role: role) }"
puts "end"
puts ""
puts "# 使用例"
puts "User.active"
puts "User.recent"
puts "User.by_role('admin')"
