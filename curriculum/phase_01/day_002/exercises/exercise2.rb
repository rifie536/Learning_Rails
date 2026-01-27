#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習2: Procを使った配列の変換
#
# 数値の配列に対して、複数の変換処理を適用できるtransformメソッドを作成してください。
#
# 要件:
# - 第1引数: 数値の配列
# - 第2引数以降: 変換用のProc（可変長引数）
# - すべてのProcを順番に適用した結果を返す
#
# 使用例:
# numbers = [1, 2, 3, 4, 5]
# double = Proc.new { |x| x * 2 }
# add_ten = Proc.new { |x| x + 10 }
#
# result = transform(numbers, double, add_ten)
# puts result.inspect
# => [12, 14, 16, 18, 20]

# TODO: ここにtransformメソッドを実装してください
def transform(numbers, *procs)
  numbers.map do |number|
    procs.reduce(number) do |result, proc|
      proc.call(result)
    end
  end
end

# テストコード
puts "=== 演習2: transformメソッド ==="
numbers = [1, 2, 3, 4, 5]
double = Proc.new { |x| x * 2 }
add_ten = Proc.new { |x| x + 10 }

result = transform(numbers, double, add_ten)
puts result.inspect