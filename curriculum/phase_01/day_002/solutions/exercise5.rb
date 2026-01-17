#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習5: イテレータの総合演習

# サンプルデータ
users = [
  { id: 1, name: "太郎", age: 25, active: true, role: "admin" },
  { id: 2, name: "花子", age: 30, active: false, role: "user" },
  { id: 3, name: "次郎", age: 22, active: true, role: "user" },
  { id: 4, name: "三郎", age: 35, active: true, role: "admin" },
  { id: 5, name: "四郎", age: 28, active: false, role: "user" }
]

# 1. アクティブなユーザーの配列を返す
def active_users(users)
  users.select { |user| user[:active] }
end

# 2. 全ユーザーの名前の配列を返す
def user_names(users)
  users.map { |user| user[:name] }
end

# 3. 全ユーザーの平均年齢を返す
def average_age(users)
  total_age = users.reduce(0) { |sum, user| sum + user[:age] }
  (total_age.to_f / users.length).round(1)
end

# 4. 管理者の人数を返す
def admin_count(users)
  users.count { |user| user[:role] == "admin" }
end

# 5. 最年長のユーザーを返す
def oldest_user(users)
  users.max_by { |user| user[:age] }
end

# 6. roleでグループ分けしたハッシュを返す
def group_by_role(users)
  users.group_by { |user| user[:role] }
end

# テスト
puts "=== 演習5: イテレータの総合演習 ==="

puts "\n1. アクティブなユーザー:"
puts active_users(users).map { |u| u[:name] }.join(", ")

puts "\n2. 全ユーザーの名前:"
puts user_names(users).join(", ")

puts "\n3. 平均年齢:"
puts "#{average_age(users)}歳"

puts "\n4. 管理者の人数:"
puts "#{admin_count(users)}人"

puts "\n5. 最年長のユーザー:"
puts "#{oldest_user(users)[:name]}さん (#{oldest_user(users)[:age]}歳)"

puts "\n6. roleでグループ分け:"
grouped = group_by_role(users)
grouped.each do |role, users_in_role|
  puts "  #{role}: #{users_in_role.map { |u| u[:name] }.join(', ')}"
end

# ボーナス: メソッドチェーン
puts "\n【ボーナス】アクティブな管理者の名前:"
active_admin_names = users
  .select { |u| u[:active] }
  .select { |u| u[:role] == "admin" }
  .map { |u| u[:name] }

puts active_admin_names.join(", ")
