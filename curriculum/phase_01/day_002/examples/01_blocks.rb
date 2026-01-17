#!/usr/bin/env ruby
# frozen_string_literal: true

# =========================================
# ブロックの基礎
# =========================================

puts "=" * 60
puts "1. ブロックとは"
puts "=" * 60

# ブロックは { } または do...end で囲まれたコードの塊
# メソッドに渡すことができる

# 例1: eachメソッドにブロックを渡す
puts "\n【例1: each with block】"
[1, 2, 3].each do |num|
  puts "数値: #{num}"
end

# 1行の場合は { } を使うのが慣習
puts "\n【例2: 1行ブロック】"
[1, 2, 3].each { |num| puts "数値: #{num}" }

puts "\n" + "=" * 60
puts "2. ブロックを受け取るメソッドの定義"
puts "=" * 60

# yieldを使ってブロックを呼び出す
def greet
  puts "メソッド開始"
  yield # ブロックを実行
  puts "メソッド終了"
end

puts "\n【例3: yieldの基本】"
greet do
  puts "  ブロック内の処理"
end

# ブロックに引数を渡す
def greet_with_name
  yield("太郎")
  yield("花子")
end

puts "\n【例4: ブロックに引数を渡す】"
greet_with_name do |name|
  puts "こんにちは、#{name}さん"
end

puts "\n" + "=" * 60
puts "3. block_given? でブロックの有無を確認"
puts "=" * 60

def optional_block
  if block_given?
    yield
  else
    puts "ブロックが渡されませんでした"
  end
end

puts "\n【例5: ブロックありの場合】"
optional_block do
  puts "ブロックが実行されました"
end

puts "\n【例6: ブロックなしの場合】"
optional_block

puts "\n" + "=" * 60
puts "4. ブロックパラメータを明示的に受け取る"
puts "=" * 60

# &block でブロックをProcオブジェクトとして受け取る
def explicit_block(&block)
  puts "ブロッククラス: #{block.class}"
  block.call if block
end

puts "\n【例7: &blockパラメータ】"
explicit_block do
  puts "ブロック実行"
end

puts "\n" + "=" * 60
puts "5. 実用例: 時間計測"
puts "=" * 60

def benchmark
  start_time = Time.now
  yield # ブロック内の処理を実行
  end_time = Time.now
  puts "処理時間: #{((end_time - start_time) * 1000).round(2)}ミリ秒"
end

puts "\n【例8: benchmarkメソッド】"
benchmark do
  sum = 0
  100_000.times { |i| sum += i }
  puts "合計: #{sum}"
end

puts "\n" + "=" * 60
puts "6. Railsでのブロック使用例"
puts "=" * 60

# Railsでよく見るパターン（イメージ）
puts "\n【例9: Railsのイメージコード】"
puts "User.all.each do |user|"
puts "  puts user.name"
puts "end"
puts ""
puts "form_with model: @user do |f|"
puts "  f.text_field :name"
puts "end"
