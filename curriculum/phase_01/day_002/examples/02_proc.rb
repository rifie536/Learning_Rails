#!/usr/bin/env ruby
# frozen_string_literal: true

# =========================================
# Procの基礎
# =========================================

puts "=" * 60
puts "1. Procとは"
puts "=" * 60

# Procはブロックをオブジェクト化したもの
# 変数に代入したり、引数として渡したりできる

puts "\n【例1: Proc の作成】"
my_proc = Proc.new { puts "Hello from Proc!" }
puts "my_proc のクラス: #{my_proc.class}"

# Procを実行する方法
puts "\n【例2: Procの実行方法】"
my_proc.call
my_proc.() # これも同じ
my_proc[]  # これも同じ

puts "\n" + "=" * 60
puts "2. Procに引数を渡す"
puts "=" * 60

puts "\n【例3: 引数ありのProc】"
greeting = Proc.new { |name| puts "こんにちは、#{name}さん" }
greeting.call("太郎")
greeting.call("花子")

puts "\n【例4: 複数の引数】"
calc = Proc.new { |a, b| puts "#{a} + #{b} = #{a + b}" }
calc.call(10, 20)

puts "\n" + "=" * 60
puts "3. Procを変数に保存して再利用"
puts "=" * 60

puts "\n【例5: Procの再利用】"
double = Proc.new { |x| x * 2 }
triple = Proc.new { |x| x * 3 }

numbers = [1, 2, 3, 4, 5]
puts "元の配列: #{numbers}"
puts "2倍: #{numbers.map(&double)}"
puts "3倍: #{numbers.map(&triple)}"

puts "\n" + "=" * 60
puts "4. Procをメソッドに渡す"
puts "=" * 60

def execute_proc(my_proc)
  puts "Proc実行前"
  my_proc.call
  puts "Proc実行後"
end

puts "\n【例6: Procを引数として渡す】"
my_proc = Proc.new { puts "  Proc内の処理" }
execute_proc(my_proc)

puts "\n" + "=" * 60
puts "5. 複数のProcを使う"
puts "=" * 60

def apply_operations(number, *procs)
  result = number
  procs.each do |proc|
    result = proc.call(result)
  end
  result
end

puts "\n【例7: 複数のProcを適用】"
add_ten = Proc.new { |x| x + 10 }
multiply_two = Proc.new { |x| x * 2 }
subtract_five = Proc.new { |x| x - 5 }

result = apply_operations(5, add_ten, multiply_two, subtract_five)
puts "5 → +10 → ×2 → -5 = #{result}" # (5 + 10) * 2 - 5 = 25

puts "\n" + "=" * 60
puts "6. procメソッド（ブロックをProcに変換）"
puts "=" * 60

def create_proc(&block)
  block # これはすでにProcオブジェクト
end

puts "\n【例8: ブロックをProcとして保存】"
my_proc = create_proc { |x| x ** 2 }
puts "5の2乗: #{my_proc.call(5)}"

puts "\n" + "=" * 60
puts "7. Procの特徴: 引数の数にルーズ"
puts "=" * 60

puts "\n【例9: 引数が足りない/多い場合】"
flexible_proc = Proc.new { |a, b| puts "a=#{a.inspect}, b=#{b.inspect}" }

flexible_proc.call(1, 2)     # 正常
flexible_proc.call(1)        # bはnil
flexible_proc.call(1, 2, 3)  # 3は無視される

puts "\n" + "=" * 60
puts "8. Railsでのプロック使用例"
puts "=" * 60

puts "\n【例10: Railsのコールバックイメージ】"
puts "class User"
puts "  before_save :normalize_email"
puts ""
puts "  private"
puts ""
puts "  def normalize_email"
puts "    self.email = email.downcase"
puts "  end"
puts "end"
