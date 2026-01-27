#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習4: ProcとLambdaの違いを確認
#
# 以下の動作を確認するコードを書いてください。
#
# 1. Procは引数が少なくてもエラーにならないことを確認
# 2. Lambdaは引数が少ないとエラーになることを確認
# 3. Procのreturnがメソッド全体から抜けることを確認
# 4. Lambdaのreturnがラムダ自身から抜けるだけであることを確認

puts "=== 演習4: ProcとLambdaの違い ==="

# TODO: 1. Procは引数が少なくてもエラーにならないことを確認
puts "\n1. Procの引数チェック（緩い）:"
my_proc = Proc.new { |a, b| puts "Proc: a=#{a.inspect}, b=#{b.inspect}" }
my_proc.call(1, 2)
my_proc.call(1)
my_proc.call(1, 2, 3)

# TODO: 2. Lambdaは引数が少ないとエラーになることを確認
puts "\n2. Lambdaの引数チェック（厳密）:"
my_lambda = ->(a, b) { puts "Lambda: a=#{a}, b=#{b}" }
my_lambda.call(1, 2)
begin
  my_lambda.call(1)
rescue ArgumentError => e
  puts "エラー: #{e.message}"
end

# TODO: 3. Procのreturnがメソッド全体から抜けることを確認
puts "\n3. Procのreturn:"

def test_proc_return
  puts "メソッド開始"
  my_proc = Proc.new { return "Procからreturn" }
  result = my_proc.call
  puts "この行は実行されない"
  "メソッドの最後"
end
result = test_proc_return
puts "メソッドの戻り値: #{result}"
# TODO: 4. Lambdaのreturnがラムダ自身から抜けるだけであることを確認
puts "\n4. Lambdaのreturn:"
def test_lambda_return
  puts "メソッド開始"
  my_lambda = -> { return "Lambdaからreturn" }
  result = my_lambda.call
  puts "この行は実行される（resultは「#{result}」）"
  "メソッドの最後"
end
result = test_lambda_return
puts "メソッドの戻り値: #{result}"