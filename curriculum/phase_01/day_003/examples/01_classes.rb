#!/usr/bin/env ruby
# Day 3: Example 1 - クラスの基本

puts "=" * 50
puts "Example 1: クラスの基本"
puts "=" * 50

# クラスの定義
class Book
  # initializeメソッド：インスタンスの初期化
  def initialize(title, author, pages)
    # インスタンス変数：@で始まる
    @title = title
    @author = author
    @pages = pages
  end

  # インスタンスメソッド：インスタンスから呼ぶ
  def display_info
    puts "タイトル: #{@title}"
    puts "著者: #{@author}"
    puts "ページ数: #{@pages}"
  end

  def read(pages_read)
    if pages_read > @pages
      puts "エラー：ページ数を超えています"
      return false
    end
    puts "#{pages_read}ページ読みました"
    true
  end
end

# インスタンスの作成
book1 = Book.new("Rubyの世界", "太郎", 300)
puts "\n--- book1の情報 ---"
book1.display_info

puts "\n--- book1を読む ---"
book1.read(50)
book1.read(100)

book2 = Book.new("Railsガイド", "花子", 450)
puts "\n--- book2の情報 ---"
book2.display_info

puts "\n--- 複数のインスタンス ---"
puts "book1とbook2は異なるオブジェクト: #{book1.object_id != book2.object_id}"

puts "\n" + "=" * 50
puts "Example 1-2: インスタンス変数へのアクセス"
puts "=" * 50

# インスタンス変数にアクセスするメソッド
class Person
  def initialize(name)
    @name = name
  end

  # メソッドでインスタンス変数にアクセス
  def introduce
    puts "私の名前は#{@name}です"
  end

  def name
    @name
  end
end

person = Person.new("太郎")
person.introduce
puts "nameメソッドで取得: #{person.name}"

# 直接アクセスはできない（Rubyの隠蔽）
begin
  # person.@name  # この形式はRubyの構文ではないのでコメント
  # インスタンス変数は外部からアクセスできない
  puts "インスタンス変数は外部からは直接アクセスできません"
rescue => e
  puts "エラー: #{e.message}"
end

puts "\n" + "=" * 50
puts "Example 1-3: クラスの構造"
puts "=" * 50

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def bark
    puts "#{@name}は: ワンワン！"
  end

  def info
    puts "名前: #{@name}, 犬種: #{@breed}"
  end
end

dog = Dog.new("ポチ", "柴犬")
dog.info
dog.bark

puts "\nクラス: #{dog.class}"
puts "インスタンス? #{dog.is_a?(Dog)}"

puts "\n" + "=" * 50
puts "Example 1: 終了"
puts "=" * 50
