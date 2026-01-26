#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習4: デバッグスキル - バグを見つけて修正
#
# 以下のコードにはバグがあります。デバッグして修正してください。
#
# 要件:
# 1. デバッグコードを追加して問題を特定
# 2. バグを修正する
# 3. puts, p, pp を使ってデバッグ出力を追加
# 4. ゼロ除算エラーを防ぐ
#
# バグ:
# - divide メソッドで n が 0 の場合に ZeroDivisionError が発生

class Calculator
  def initialize(value)
    @value = value
  end

  def add(n)
    @value + n
  end

  def multiply(n)
    @value * n
  end

  # TODO: このメソッドにバグがあります。ゼロ除算を防ぐように修正してください
  def divide(n)
    @value / n  # バグ：n が 0 の場合クラッシュ
  end

  def result
    @value
  end

  def reset
    @value = 0
  end
end

# テストコード
puts "=== 演習4: デバッグスキル ==="

calc = Calculator.new(10)
puts "初期値: #{calc.result}"

puts "\n加算テスト:"
puts "10 + 5 = #{calc.add(5)}"

puts "\n乗算テスト:"
puts "15 * 2 = #{calc.multiply(2)}"

puts "\n除算テスト:"
puts "30 / 5 = #{calc.divide(5)}"

puts "\nゼロ除算テスト（エラーが発生するはず）:"
begin
  puts "6 / 0 = #{calc.divide(0)}"
rescue ZeroDivisionError => e
  puts "❌ エラー: #{e.message}"
  puts "バグを修正してください！"
end
