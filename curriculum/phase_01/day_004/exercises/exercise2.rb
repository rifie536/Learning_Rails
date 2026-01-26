#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習2: define_methodでアクセサの自動生成
#
# 以下の要件に従ってModelクラスを作成してください。
#
# 要件:
# - Model 親クラスを作成
# - columns(*names) クラスメソッドでアクセサを自動生成
# - initialize で複数の値を受け取り初期化
# - attributes ハッシュですべての属性を保持
#
# 使用例:
# class User < Model
#   columns :name, :email, :age
# end
#
# user = User.new("太郎", "taro@example.com", 25)
# puts user.name      # => "太郎"
# puts user.email     # => "taro@example.com"
#
# user.age = 26
# puts user.age       # => 26

# TODO: ここにModelクラスを実装してください
# ヒント: define_method を使ってゲッターとセッターを自動生成します


# テストコード
puts "=== 演習2: define_methodでアクセサの自動生成 ==="

class User < Model
  columns :name, :email, :age
end

user = User.new("太郎", "taro@example.com", 25)
puts "名前: #{user.name}"
puts "メール: #{user.email}"
puts "年齢: #{user.age}"

user.age = 26
puts "\n年齢を更新: #{user.age}"

puts "\nすべての属性:"
p user.attributes
