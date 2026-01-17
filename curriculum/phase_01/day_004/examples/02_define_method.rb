#!/usr/bin/env ruby
# Day 4: Example 2 - define_method

puts "=" * 50
puts "Example 2: define_method"
puts "=" * 50

# define_methodを使ってメソッドを動的に定義
class Greeter
  define_method(:hello) do
    puts "こんにちは！"
  end

  define_method(:goodbye) do
    puts "さようなら！"
  end
end

puts "\n--- define_methodで定義されたメソッド ---"
greeter = Greeter.new
greeter.hello
greeter.goodbye

puts "\n" + "=" * 50
puts "Example 2-2: define_methodのブロックに引数を渡す"
puts "=" * 50

class Person
  define_method(:greet) do |name|
    puts "こんにちは、#{name}さん"
  end

  define_method(:introduce) do |name, age|
    puts "私の名前は#{name}で、#{age}歳です"
  end
end

puts "\n--- 引数付きのdefine_method ---"
person = Person.new
person.greet("太郎")
person.introduce("花子", 25)

puts "\n" + "=" * 50
puts "Example 2-3: ループでメソッドを一括生成"
puts "=" * 50

class Multiplier
  # 1から10までの乗算メソッドを生成
  (1..10).each do |n|
    define_method("times_#{n}") do |x|
      x * n
    end
  end
end

puts "\n--- ループで生成されたメソッド ---"
mult = Multiplier.new
puts "5 * 3 = #{mult.times_3(5)}"
puts "10 * 7 = #{mult.times_7(10)}"

puts "\n" + "=" * 50
puts "Example 2-4: attr_accessorの仕組み"
puts "=" * 50

# 手動でattr_accessorと同じことを実装
class BookManual
  def initialize(title, author)
    @title = title
    @author = author
  end

  # 読み込みメソッド
  define_method(:title) do
    @title
  end

  define_method(:author) do
    @author
  end

  # 書き込みメソッド
  define_method(:title=) do |value|
    @title = value
  end

  define_method(:author=) do |value|
    @author = value
  end
end

puts "\n--- define_methodでattr_accessorを実装 ---"
book = BookManual.new("Ruby入門", "太郎")
puts "タイトル: #{book.title}"
puts "著者: #{book.author}"

book.title = "改訂版Ruby入門"
puts "更新後: #{book.title}"

puts "\n" + "=" * 50
puts "Example 2-5: Railsのscopeのような機能"
puts "=" * 50

class User
  def initialize(name, active)
    @name = name
    @active = active
  end

  # scopeメソッドでLambdaを生成
  def self.scope(name, condition)
    define_method(name) do
      condition.call(self)
    end
  end

  attr_accessor :name, :active
end

# メタデータを保持するための配列
users = [
  { name: "太郎", active: true },
  { name: "花子", active: false },
  { name: "次郎", active: true }
]

puts "\n--- 動的なスコープメソッドの生成 ---"
puts "アクティブなユーザー:"
users.each do |u|
  puts "- #{u[:name]}" if u[:active]
end

puts "\n" + "=" * 50
puts "Example 2-6: DSLライクなAPI生成"
puts "=" * 50

class ConfigBuilder
  def initialize
    @config = {}
  end

  # キーごとにメソッドを生成
  def method_missing(method_name, *args, &block)
    if method_name.to_s.end_with?("=")
      # 値を設定
      key = method_name.to_s.gsub("=", "").to_sym
      @config[key] = args.first
    else
      # 値を取得
      @config[method_name]
    end
  end

  def self.build
    builder = new
    yield builder
    builder.config
  end

  attr_reader :config
end

puts "\n--- DSLライクなAPI ---"
config = ConfigBuilder.build do |c|
  c.database = "postgresql"
  c.host = "localhost"
  c.port = 5432
end

puts "Database: #{config[:database]}"
puts "Host: #{config[:host]}"
puts "Port: #{config[:port]}"

puts "\n" + "=" * 50
puts "Example 2-7: ゲッター/セッター生成のユーティリティ"
puts "=" * 50

class ModelBase
  def self.attr_accessors(*names)
    names.each do |name|
      # ゲッター
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      # セッター
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

class Product < ModelBase
  attr_accessors :name, :price, :stock

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end

puts "\n--- カスタムattr_accessors ---"
product = Product.new("ノート", 500, 100)
puts "商品名: #{product.name}"
puts "価格: ¥#{product.price}"
puts "在庫: #{product.stock}個"

product.price = 600
puts "値上げ後: ¥#{product.price}"

puts "\n" + "=" * 50
puts "Example 2: 終了"
puts "=" * 50
