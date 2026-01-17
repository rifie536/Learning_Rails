#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習3: Lambdaを使ったフィルタリング

def filter_by(array, filter_lambda)
  # Lambdaであることを確認
  raise ArgumentError, "filter must be a Lambda" unless filter_lambda.lambda?

  array.select { |element| filter_lambda.call(element) }
end

# テスト
puts "=== 演習3: filter_byメソッド ==="
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

is_even = ->(n) { n.even? }
greater_than_five = ->(n) { n > 5 }
divisible_by_three = ->(n) { n % 3 == 0 }

puts "元の配列: #{numbers.inspect}"
puts "偶数: #{filter_by(numbers, is_even).inspect}"
puts "5より大きい: #{filter_by(numbers, greater_than_five).inspect}"
puts "3で割り切れる: #{filter_by(numbers, divisible_by_three).inspect}"

# エラーケースのテスト
puts "\nProcを渡した場合（エラーになる）:"
begin
  not_lambda = Proc.new { |n| n.even? }
  filter_by(numbers, not_lambda)
rescue ArgumentError => e
  puts "エラー: #{e.message}"
end
