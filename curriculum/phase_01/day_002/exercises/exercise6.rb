#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習6: ブロック、Proc、Lambdaを組み合わせる
#
# 以下の機能を持つCalculatorクラスを作成してください。
#
# 要件:
# - 初期値を設定できる
# - applyメソッドでブロックまたはProc/Lambdaを受け取り、現在の値に適用
# - resultメソッドで現在の値を返す
# - メソッドチェーンが可能
#
# 使用例:
# calc = Calculator.new(10)
#
# calc
#   .apply { |x| x + 5 }
#   .apply { |x| x * 2 }
#   .apply { |x| x - 3 }
#
# puts calc.result  # => 27
#
# # Proc/Lambdaも使える
# double = ->(x) { x * 2 }
# add_ten = Proc.new { |x| x + 10 }
#
# calc2 = Calculator.new(5)
# calc2.apply(&double).apply(&add_ten)
# puts calc2.result  # => 20

# TODO: ここにCalculatorクラスを実装してください


# テストコード
puts "=== 演習6: Calculatorクラス ==="

puts "\nテスト1: ブロックを使った計算"
calc = Calculator.new(10)
calc
  .apply { |x| x + 5 }
  .apply { |x| x * 2 }
  .apply { |x| x - 3 }

puts "結果: #{calc.result}  # 期待値: 27"

puts "\nテスト2: Proc/Lambdaを使った計算"
double = ->(x) { x * 2 }
add_ten = Proc.new { |x| x + 10 }

calc2 = Calculator.new(5)
calc2.apply(&double).apply(&add_ten)
puts "結果: #{calc2.result}  # 期待値: 20"
