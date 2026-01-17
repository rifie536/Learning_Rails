#!/usr/bin/env ruby
# frozen_string_literal: true

# =========================================
# ProcとLambdaの違い
# =========================================

puts "=" * 60
puts "ProcとLambdaの主な違い"
puts "=" * 60

puts "\n1. 引数の扱い"
puts "2. returnの振る舞い"
puts "3. lambda?メソッドの結果"

puts "\n" + "=" * 60
puts "違い1: 引数の数チェック"
puts "=" * 60

puts "\n【Proc: 引数の数にルーズ】"
my_proc = Proc.new { |a, b| puts "Proc: a=#{a.inspect}, b=#{b.inspect}" }
my_proc.call(1, 2)      # a=1, b=2
my_proc.call(1)         # a=1, b=nil（エラーにならない）
my_proc.call(1, 2, 3)   # a=1, b=2（3は無視される）

puts "\n【Lambda: 引数の数に厳格】"
my_lambda = ->(a, b) { puts "Lambda: a=#{a}, b=#{b}" }
my_lambda.call(1, 2)    # a=1, b=2

begin
  my_lambda.call(1)     # ArgumentError
rescue ArgumentError => e
  puts "エラー: #{e.message}"
end

begin
  my_lambda.call(1, 2, 3)  # ArgumentError
rescue ArgumentError => e
  puts "エラー: #{e.message}"
end

puts "\n" + "=" * 60
puts "違い2: returnの振る舞い"
puts "=" * 60

puts "\n【Proc: returnでメソッドから抜ける】"

def test_proc_return
  puts "メソッド開始"

  my_proc = Proc.new { return "Procからreturn" }
  result = my_proc.call

  puts "この行は実行されない"
  "メソッドの最後"
end

result = test_proc_return
puts "結果: #{result}"
puts "→ Procのreturnは、それを囲むメソッド全体から抜ける"

puts "\n【Lambda: returnでLambdaから抜けるだけ】"

def test_lambda_return
  puts "メソッド開始"

  my_lambda = -> { return "Lambdaからreturn" }
  result = my_lambda.call
  puts "結果: #{result}"

  puts "この行も実行される"
  "メソッドの最後"
end

result = test_lambda_return
puts "最終結果: #{result}"
puts "→ Lambdaのreturnは、Lambda自身から抜けるだけ"

puts "\n" + "=" * 60
puts "違い3: lambda?メソッド"
puts "=" * 60

puts "\n【確認】"
my_proc = Proc.new { }
my_lambda = -> { }

puts "Proc.lambda?: #{my_proc.lambda?}"     # false
puts "Lambda.lambda?: #{my_lambda.lambda?}" # true

puts "\n" + "=" * 60
puts "比較表"
puts "=" * 60

puts "\n┌─────────────────┬──────────────┬──────────────┐"
puts "│      特徴       │    Proc      │   Lambda     │"
puts "├─────────────────┼──────────────┼──────────────┤"
puts "│ 引数の数チェック │  ルーズ      │  厳格        │"
puts "│ return の動作   │ メソッドから │ 自身から     │"
puts "│ 作成方法        │ Proc.new     │ lambda / ->  │"
puts "│ lambda?         │ false        │ true         │"
puts "└─────────────────┴──────────────┴──────────────┘"

puts "\n" + "=" * 60
puts "使い分けの目安"
puts "=" * 60

puts "\n【Procを使う場合】"
puts "- コールバック"
puts "- ブロックをオブジェクトとして扱いたい"
puts "- 引数の柔軟性が欲しい"

puts "\n【Lambdaを使う場合】"
puts "- 通常の関数のように扱いたい（Railsのscope等）"
puts "- 引数の数を厳密にチェックしたい"
puts "- returnを安全に使いたい"

puts "\n" + "=" * 60
puts "実践例"
puts "=" * 60

puts "\n【例1: コールバックとしてのProc】"

class DataProcessor
  def initialize
    @callbacks = []
  end

  def add_callback(&block)
    @callbacks << block # ブロックをProcとして保存
  end

  def process(data)
    puts "データ処理中: #{data}"
    @callbacks.each { |callback| callback.call(data) }
  end
end

processor = DataProcessor.new
processor.add_callback { |data| puts "  コールバック1: #{data.upcase}" }
processor.add_callback { |data| puts "  コールバック2: #{data.reverse}" }
processor.process("hello")

puts "\n【例2: スコープとしてのLambda】"

class User
  attr_accessor :name, :active, :role

  def initialize(name, active, role)
    @name = name
    @active = active
    @role = role
  end

  # Lambdaでスコープのような機能を実装
  def self.active
    -> (users) { users.select { |u| u.active } }
  end

  def self.by_role(role)
    -> (users) { users.select { |u| u.role == role } }
  end
end

users = [
  User.new("太郎", true, "admin"),
  User.new("花子", false, "user"),
  User.new("次郎", true, "user")
]

active_users = User.active.call(users)
puts "アクティブユーザー: #{active_users.map(&:name).join(', ')}"

admin_users = User.by_role("admin").call(users)
puts "管理者: #{admin_users.map(&:name).join(', ')}"
