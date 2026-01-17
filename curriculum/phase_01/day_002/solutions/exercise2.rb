#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習2: Procを使った配列の変換

def transform(array, *procs)
  array.map do |value|
    result = value
    procs.each do |proc|
      result = proc.call(result)
    end
    result
  end
end

# テスト
puts "=== 演習2: transformメソッド ==="
numbers = [1, 2, 3, 4, 5]
double = Proc.new { |x| x * 2 }
add_ten = Proc.new { |x| x + 10 }

result = transform(numbers, double, add_ten)
puts "元の配列: #{numbers.inspect}"
puts "変換後: #{result.inspect}"
puts "計算: 各要素を2倍してから10を加算"

puts "\n別の例（3つのProc）:"
triple = Proc.new { |x| x * 3 }
subtract_five = Proc.new { |x| x - 5 }
square = Proc.new { |x| x ** 2 }

result2 = transform([1, 2, 3], triple, subtract_five, square)
puts "元の配列: [1, 2, 3]"
puts "変換後: #{result2.inspect}"
puts "計算: (x * 3 - 5)^2"
