#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習4: ProcとLambdaの違いを確認

puts "=== 演習4: ProcとLambdaの違い ==="

# 1. Procは引数が少なくてもエラーにならない
puts "\n1. Procは引数が少なくてもエラーにならない"
my_proc = Proc.new { |a, b| puts "Proc: a=#{a.inspect}, b=#{b.inspect}" }
my_proc.call(1)  # a=1, b=nil（エラーにならない）
puts "→ Procは引数不足でもnilで補完される"

# 2. Lambdaは引数が少ないとエラーになる
puts "\n2. Lambdaは引数が少ないとエラーになる"
my_lambda = ->(a, b) { puts "Lambda: a=#{a}, b=#{b}" }
begin
  my_lambda.call(1)  # ArgumentError
rescue ArgumentError => e
  puts "エラー: #{e.message}"
  puts "→ Lambdaは引数の数に厳格"
end

# 3. Procのreturnがメソッド全体から抜ける
puts "\n3. Procのreturnがメソッド全体から抜ける"

def test_proc_return
  puts "メソッド開始"

  my_proc = Proc.new do
    puts "  Proc内でreturn実行"
    return "Procからreturn"  # ここでメソッド全体から抜ける
  end

  result = my_proc.call
  puts "この行は実行されない"  # 実行されない
  "メソッドの最後"  # ここには到達しない
end

result = test_proc_return
puts "メソッドの戻り値: #{result}"
puts "→ Procのreturnはメソッド全体から抜ける"

# 4. Lambdaのreturnがラムダ自身から抜けるだけ
puts "\n4. Lambdaのreturnがラムダ自身から抜けるだけ"

def test_lambda_return
  puts "メソッド開始"

  my_lambda = lambda do
    puts "  Lambda内でreturn実行"
    return "Lambdaからreturn"  # Lambdaから抜けるだけ
  end

  result = my_lambda.call
  puts "  Lambda実行後の処理"
  puts "  Lambda戻り値: #{result}"
  "メソッドの最後"  # ここまで実行される
end

result = test_lambda_return
puts "メソッドの戻り値: #{result}"
puts "→ Lambdaのreturnは自身から抜けるだけ"

# まとめ
puts "\n" + "=" * 60
puts "まとめ"
puts "=" * 60
puts "Proc:"
puts "  - 引数の数にルーズ（足りない場合はnil）"
puts "  - returnでメソッド全体から抜ける"
puts ""
puts "Lambda:"
puts "  - 引数の数に厳格（足りないとArgumentError）"
puts "  - returnで自身から抜けるだけ"
