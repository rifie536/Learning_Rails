#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習5: 複合デバッグ - ユーザーマネージャーのバグ修正
#
# 以下のコードにはバグがあります。デバッグして修正してください。
#
# 要件:
# 1. デバッグコードを追加
# 2. 各メソッドの動作を確認
# 3. 問題を特定して修正
# 4. すべてのテストが期待通りに動作するようにする
#
# ヒント:
# - add メソッドが @value を更新していない可能性がある
# - multiply メソッドも同様に @value を更新していない可能性がある

class User
  attr_accessor :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end
end

class UserManager
  def initialize
    @users = []
  end

  def add_user(id, name, email)
    @users << User.new(id, name, email)
  end

  def find_by_id(id)
    @users.find { |u| u.id == id }
  end

  def find_by_email(email)
    @users.find { |u| u.email == email }
  end

  def all_users
    @users
  end

  def remove_user(id)
    @users.delete_if { |u| u.id == id }
  end
end

# TODO: 上記のコードを確認し、バグがあれば修正してください
# ヒント: このコードは実は正常に動作します。
#         しかし、デバッグスキルの練習として、以下を実装してください：
# 1. 各メソッドにデバッグ出力を追加
# 2. ユーザーが見つからない場合のエラーハンドリングを追加
# 3. バリデーションを追加（例：同じIDのユーザーを追加できないようにする）

# テストコード
puts "=== 演習5: 複合デバッグ ==="

manager = UserManager.new

puts "\nユーザーを追加:"
manager.add_user(1, "太郎", "taro@example.com")
manager.add_user(2, "花子", "hanako@example.com")
manager.add_user(3, "次郎", "jiro@example.com")
puts "追加されたユーザー数: #{manager.all_users.length}"

puts "\nメールアドレスで検索:"
user = manager.find_by_email("taro@example.com")
if user
  puts "見つかったユーザー: #{user.name}"
else
  puts "ユーザーが見つかりませんでした"
end

puts "\nユーザーを削除:"
manager.remove_user(2)
puts "削除後のユーザー数: #{manager.all_users.length}"

puts "\n削除されたユーザーを検索:"
removed = manager.find_by_email("hanako@example.com")
if removed.nil?
  puts "✅ ユーザーは正しく削除されました"
else
  puts "❌ ユーザーがまだ存在しています"
end

puts "\n残っているユーザー:"
manager.all_users.each do |u|
  puts "  - #{u.name} (#{u.email})"
end
