#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習4: バリデーション機能
#
# 以下の要件に従ってValidatorを実装してください。
#
# 要件:
# - 親クラス Validator を作成
# - validates クラスメソッドで複数のバリデーションルールを登録
# - presence: true（必須チェック）
# - length: n（文字列長チェック）
# - format: /regex/（正規表現マッチ）
# - numericality: true（数値チェック）
# - validate メソッドですべてのバリデーションを実行
# - エラーの配列を返す
#
# 使用例:
# class Person < Validator
#   validates :name, presence: true, length: 50
#   validates :email, presence: true, format: /@/
#   validates :age, numericality: true
# end
#
# person = Person.new("太郎", "taro@example.com", "25")
# errors = person.validate
# puts errors.empty? ? "OK" : errors.join(", ")

# TODO: ここにValidatorクラスを実装してください
# ヒント: クラス変数を使ってバリデーションルールを保存します


# テストコード
puts "=== 演習4: バリデーション機能 ==="

class Person < Validator
  validates :name, presence: true, length: 50
  validates :email, presence: true, format: /@/
  validates :age, numericality: true
end

puts "正常なデータ:"
person = Person.new("太郎", "taro@example.com", "25")
errors = person.validate
puts errors.empty? ? "✅ バリデーション成功" : "エラー: #{errors.join(', ')}"

puts "\n名前が空:"
person = Person.new("", "taro@example.com", "25")
errors = person.validate
puts errors.empty? ? "OK" : "❌ #{errors.join(', ')}"

puts "\nメールアドレスの形式が不正:"
person = Person.new("太郎", "invalid-email", "25")
errors = person.validate
puts errors.empty? ? "OK" : "❌ #{errors.join(', ')}"

puts "\n年齢が数値ではない:"
person = Person.new("太郎", "taro@example.com", "abc")
errors = person.validate
puts errors.empty? ? "OK" : "❌ #{errors.join(', ')}"

puts "\n名前が長すぎる:"
person = Person.new("あ" * 51, "taro@example.com", "25")
errors = person.validate
puts errors.empty? ? "OK" : "❌ #{errors.join(', ')}"
