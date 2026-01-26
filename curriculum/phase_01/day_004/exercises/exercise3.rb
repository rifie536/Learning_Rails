#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習3: method_missingでfind_by_XXX実装
#
# 以下の要件に従ってRepositoryクラスを作成してください。
#
# 要件:
# - initialize でデータの配列を受け取る
# - `find_by_XXX` パターンのメソッドをサポート
# - find_by_name("太郎") のように呼び出す
# - マッチしたデータを返す（複数の場合は最初の1件）
# - respond_to_missing? も実装
#
# 使用例:
# users = [
#   { id: 1, name: "太郎", email: "taro@example.com" },
#   { id: 2, name: "花子", email: "hanako@example.com" }
# ]
#
# repo = UserRepository.new(users)
# puts repo.find_by_name("太郎")[:email]  # => "taro@example.com"
# puts repo.find_by_id(2)[:name]          # => "花子"

# TODO: ここにUserRepositoryクラスを実装してください
# ヒント: method_missing と respond_to_missing? を使います


# テストコード
puts "=== 演習3: method_missingでfind_by_XXX実装 ==="

users = [
  { id: 1, name: "太郎", email: "taro@example.com", age: 25 },
  { id: 2, name: "花子", email: "hanako@example.com", age: 30 },
  { id: 3, name: "次郎", email: "jiro@example.com", age: 22 }
]

repo = UserRepository.new(users)

puts "find_by_name('太郎'):"
user = repo.find_by_name("太郎")
puts "  メール: #{user[:email]}"
puts "  年齢: #{user[:age]}"

puts "\nfind_by_id(2):"
user = repo.find_by_id(2)
puts "  名前: #{user[:name]}"
puts "  メール: #{user[:email]}"

puts "\nfind_by_email('jiro@example.com'):"
user = repo.find_by_email("jiro@example.com")
puts "  名前: #{user[:name]}"
puts "  ID: #{user[:id]}"
