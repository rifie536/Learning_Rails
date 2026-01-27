#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習5: イテレータの総合演習
#
# ユーザーデータの配列を操作する以下のメソッドを実装してください。

users = [
  { id: 1, name: "太郎", age: 25, active: true, role: "admin" },
  { id: 2, name: "花子", age: 30, active: false, role: "user" },
  { id: 3, name: "次郎", age: 22, active: true, role: "user" },
  { id: 4, name: "三郎", age: 35, active: true, role: "admin" },
  { id: 5, name: "四郎", age: 28, active: false, role: "user" }
]

# TODO: 1. active_users(users) - アクティブなユーザーの配列を返す
def active_users(users)
  users.select { |user| user[:active] }
end

# TODO: 2. user_names(users) - 全ユーザーの名前の配列を返す
def user_names(users)
  users.map { |user| user[:name] }
end

# TODO: 3. average_age(users) - 全ユーザーの平均年齢を返す（小数点第1位まで）
def average_age(users)
  (users.reduce(0) { |sum, user| sum + user[:age] } / users.length.to_f).round(1)
end

# TODO: 4. admin_count(users) - 管理者の人数を返す
def admin_count(users)
  users.count { |user| user[:role] == "admin" }
end

# TODO: 5. oldest_user(users) - 最年長のユーザーを返す
def oldest_user(users)
  users.max_by { |user| user[:age] }
end

# TODO: 6. group_by_role(users) - roleでグループ分けしたハッシュを返す
def group_by_role(users)
  users.group_by { |user| user[:role] }
end

# テストコード
puts "=== 演習5: イテレータの総合演習 ==="

puts "\n1. アクティブなユーザー:"
puts active_users(users).map { |u| u[:name] }.join(", ")

puts "\n2. 全ユーザー名:"
puts user_names(users).join(", ")

puts "\n3. 平均年齢:"
puts average_age(users)

puts "\n4. 管理者の人数:"
puts admin_count(users)

puts "\n5. 最年長のユーザー:"
puts oldest_user(users)[:name]

puts "\n6. roleでグループ分け:"
p group_by_role(users).keys
