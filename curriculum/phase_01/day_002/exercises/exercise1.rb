#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習1: ブロックを受け取るメソッドの作成
#
# repeatメソッドを作成してください。このメソッドは回数を引数に取り、
# その回数だけブロックを実行します。
#
# 要件:
# - 第1引数: 繰り返し回数
# - ブロックを受け取る
# - ブロックにカウンタ（1から始まる）を渡す
#
# 使用例:
# repeat(3) do |count|
#   puts "#{count}回目の実行"
# end
#
# 出力:
# 1回目の実行
# 2回目の実行
# 3回目の実行

# TODO: ここにrepeatメソッドを実装してください


# テストコード
puts "=== 演習1: repeatメソッド ==="
repeat(3) do |count|
  puts "#{count}回目の実行"
end
