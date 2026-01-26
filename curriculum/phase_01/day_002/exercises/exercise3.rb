#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習3: Lambdaを使ったフィルタリング
#
# Lambdaを使って、配列から条件に合う要素を抽出するfilter_byメソッドを作成してください。
#
# 要件:
# - 第1引数: 配列
# - 第2引数: フィルタ条件を表すLambda
# - 条件に合う要素の配列を返す
# - Lambdaでない場合はエラーを発生させる
#
# 使用例:
# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# is_even = ->(n) { n.even? }
# greater_than_five = ->(n) { n > 5 }
#
# puts filter_by(numbers, is_even).inspect
# => [2, 4, 6, 8, 10]
#
# puts filter_by(numbers, greater_than_five).inspect
# => [6, 7, 8, 9, 10]

# TODO: ここにfilter_byメソッドを実装してください
# ヒント: Lambda.lambda? メソッドでLambdaかどうかチェックできます


# テストコード
puts "=== 演習3: filter_byメソッド ==="
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
is_even = ->(n) { n.even? }
greater_than_five = ->(n) { n > 5 }

puts filter_by(numbers, is_even).inspect
puts filter_by(numbers, greater_than_five).inspect
