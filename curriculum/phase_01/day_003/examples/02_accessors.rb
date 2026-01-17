#!/usr/bin/env ruby
# Day 3: Example 2 - アクセサメソッド

puts "=" * 50
puts "Example 2: アクセサメソッド"
puts "=" * 50

# attr_reader, attr_writer, attr_accessorなし（手動実装）
class BookManual
  def initialize(title, author)
    @title = title
    @author = author
  end

  # 読み取り用メソッド
  def title
    @title
  end

  # 書き込み用メソッド
  def title=(value)
    @title = value
  end

  def author
    @author
  end

  def author=(value)
    @author = value
  end
end

puts "\n--- 手動でのアクセサメソッド ---"
book = BookManual.new("Ruby入門", "太郎")
puts "タイトル: #{book.title}"
puts "著者: #{book.author}"

book.title = "改訂版Ruby入門"
puts "更新後のタイトル: #{book.title}"

puts "\n" + "=" * 50
puts "Example 2-2: attr_readerの使用"
puts "=" * 50

class Car
  # attr_reader: 読み込み専用のアクセサメソッドを自動生成
  attr_reader :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def display_info
    puts "ブランド: #{@brand}"
    puts "モデル: #{@model}"
  end
end

car = Car.new("トヨタ", "プリウス")
puts "ブランド: #{car.brand}"
puts "モデル: #{car.model}"

# 書き込みはできない
begin
  car.brand = "日産"
rescue NoMethodError => e
  puts "エラー: attr_readerは読み込み専用です"
end

puts "\n" + "=" * 50
puts "Example 2-3: attr_writerの使用"
puts "=" * 50

class Secret
  # attr_writer: 書き込み専用のアクセサメソッドを自動生成
  attr_writer :password

  def initialize
    @password = nil
  end

  def password_set?
    @password != nil
  end

  def check_password(input)
    input == @password
  end
end

secret = Secret.new
secret.password = "mysecret123"
puts "パスワード設定済み? #{secret.password_set?}"
puts "パスワード確認: #{secret.check_password('mysecret123')}"
puts "パスワード確認（間違い）: #{secret.check_password('wrong')}"

# 読み込みはできない
begin
  puts secret.password
rescue NoMethodError => e
  puts "エラー: attr_writerは書き込み専用です"
end

puts "\n" + "=" * 50
puts "Example 2-4: attr_accessorの使用"
puts "=" * 50

class User
  # attr_accessor: 読み込みと書き込みのアクセサメソッドを自動生成
  attr_accessor :name, :email, :age

  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
  end

  def info
    puts "名前: #{@name}"
    puts "メール: #{@email}"
    puts "年齢: #{@age}"
  end
end

user = User.new("太郎", "taro@example.com", 25)
puts "--- ユーザー情報（初期値） ---"
user.info

puts "\n--- ユーザー情報を更新 ---"
user.name = "太郎田中"
user.email = "taro.tanaka@example.com"
user.age = 26
user.info

puts "\n" + "=" * 50
puts "Example 2-5: 複数のアクセサメソッド"
puts "=" * 50

class Product
  attr_reader :id
  attr_accessor :name, :price
  attr_writer :cost

  def initialize(id, name, price, cost)
    @id = id
    @name = name
    @price = price
    @cost = cost
  end

  def display
    puts "ID: #{@id} (読み込み専用)"
    puts "商品名: #{@name} (読み書き)"
    puts "価格: #{@price} (読み書き)"
    puts "原価: #{@cost} (書き込み専用)"
  end

  def profit
    @price - @cost
  end

  def cost
    "非表示"
  end
end

product = Product.new(1, "ノート", 500, 200)
puts "--- 初期状態 ---"
product.display

puts "\n--- 情報を変更 ---"
product.name = "高級ノート"
product.price = 800
product.cost = 300
product.display

puts "\n利益: #{product.profit}円"

puts "\nID取得（読み込み専用）: #{product.id}"
begin
  product.id = 2
rescue NoMethodError => e
  puts "エラー: IDは読み込み専用です"
end

puts "\n" + "=" * 50
puts "Example 2-6: Railsでの実践例"
puts "=" * 50

class Post
  attr_accessor :title, :content
  attr_reader :created_at
  attr_writer :author

  def initialize(title, content, author)
    @title = title
    @content = content
    @author = author
    @created_at = Time.now
  end

  def show
    puts "タイトル: #{@title}"
    puts "本文: #{@content}"
    puts "著者: #{@author}"
    puts "作成日時: #{@created_at}"
  end
end

post = Post.new("Rubyについて", "Rubyは素晴らしい言語です", "太郎")
post.show

puts "\n--- 記事を編集 ---"
post.title = "Rubyについて（改訂版）"
post.content = "Rubyは本当に素晴らしい言語です"
post.show

puts "\n" + "=" * 50
puts "Example 2: 終了"
puts "=" * 50
