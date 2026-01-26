#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習6: DSL（Domain Specific Language）でクエリビルダ
#
# 以下の要件に従ってQueryBuilderを実装してください。
#
# 要件:
# - QueryBuilder クラスを作成
# - where(column, value) でフィルタリング条件を追加
# - order_by(column, direction) でソート条件を追加
# - limit(n) で件数制限を追加
# - execute で条件に合うデータを返す
# - メソッドチェーン可能
#
# 使用例:
# users = [
#   { id: 1, name: "太郎", age: 25, active: true },
#   { id: 2, name: "花子", age: 30, active: false },
#   { id: 3, name: "次郎", age: 28, active: true }
# ]
#
# result = QueryBuilder.new(users)
#   .where(:age, lambda { |v| v > 25 })
#   .order_by(:age, :asc)
#   .limit(2)
#   .execute
#
# puts result[0][:name]  # => "次郎"
# puts result[1][:name]  # => "花子"

# TODO: ここにQueryBuilderクラスを実装してください
# ヒント: メソッドチェーンのために self を返します


# テストコード
puts "=== 演習6: DSL（Domain Specific Language）でクエリビルダ ==="

users = [
  { id: 1, name: "太郎", age: 25, active: true, role: "admin" },
  { id: 2, name: "花子", age: 30, active: false, role: "user" },
  { id: 3, name: "次郎", age: 28, active: true, role: "user" },
  { id: 4, name: "三郎", age: 35, active: true, role: "admin" },
  { id: 5, name: "四郎", age: 22, active: false, role: "user" }
]

puts "条件1: age > 25 で age 昇順、上位2件"
result = QueryBuilder.new(users)
  .where(:age, ->(v) { v > 25 })
  .order_by(:age, :asc)
  .limit(2)
  .execute

result.each do |user|
  puts "  #{user[:name]} (#{user[:age]}歳)"
end

puts "\n条件2: active が true で name 昇順"
result = QueryBuilder.new(users)
  .where(:active, ->(v) { v == true })
  .order_by(:name, :asc)
  .execute

result.each do |user|
  puts "  #{user[:name]} (#{user[:role]})"
end

puts "\n条件3: role が admin で age 降順、上位1件"
result = QueryBuilder.new(users)
  .where(:role, ->(v) { v == "admin" })
  .order_by(:age, :desc)
  .limit(1)
  .execute

result.each do |user|
  puts "  #{user[:name]} (#{user[:age]}歳, #{user[:role]})"
end
