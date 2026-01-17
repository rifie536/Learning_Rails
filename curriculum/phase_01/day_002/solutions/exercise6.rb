#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習6: Calculatorクラス

class Calculator
  def initialize(initial_value)
    @value = initial_value
  end

  def apply(&block)
    @value = block.call(@value)
    self  # メソッドチェーンのために自身を返す
  end

  def result
    @value
  end
end

# テスト
puts "=== 演習6: Calculatorクラス ==="

puts "\n1. ブロックを使った計算:"
calc = Calculator.new(10)

calc
  .apply { |x| x + 5 }
  .apply { |x| x * 2 }
  .apply { |x| x - 3 }

puts "結果: #{calc.result}"
puts "計算過程: (10 + 5) * 2 - 3 = #{calc.result}"

puts "\n2. Proc/Lambdaを使った計算:"
double = ->(x) { x * 2 }
add_ten = Proc.new { |x| x + 10 }
square = ->(x) { x ** 2 }

calc2 = Calculator.new(5)
calc2
  .apply(&double)
  .apply(&add_ten)
  .apply(&square)

puts "結果: #{calc2.result}"
puts "計算過程: ((5 * 2) + 10)^2 = #{calc2.result}"

puts "\n3. 複雑な計算:"
calc3 = Calculator.new(100)
  .apply { |x| x / 2 }      # 50
  .apply { |x| x + 25 }     # 75
  .apply { |x| x * 2 }      # 150
  .apply { |x| x - 50 }     # 100

puts "結果: #{calc3.result}"

# ボーナス: 計算履歴を記録する拡張版
class AdvancedCalculator < Calculator
  attr_reader :history

  def initialize(initial_value)
    super
    @history = [initial_value]
  end

  def apply(&block)
    @value = block.call(@value)
    @history << @value
    self
  end

  def show_history
    puts "\n計算履歴:"
    @history.each_with_index do |value, index|
      puts "  ステップ #{index}: #{value}"
    end
  end
end

puts "\n【ボーナス】計算履歴付き:"
adv_calc = AdvancedCalculator.new(10)
  .apply { |x| x * 2 }
  .apply { |x| x + 5 }
  .apply { |x| x / 3 }

puts "最終結果: #{adv_calc.result}"
adv_calc.show_history
