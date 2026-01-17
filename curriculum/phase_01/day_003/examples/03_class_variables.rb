#!/usr/bin/env ruby
# Day 3: Example 3 - クラス変数とクラスメソッド

puts "=" * 50
puts "Example 3: クラス変数とクラスメソッド"
puts "=" * 50

# クラス変数（@@で始まる）
class Counter
  @@count = 0  # クラス変数：すべてのインスタンスで共有

  def initialize(name)
    @name = name  # インスタンス変数：各インスタンスで独立
    @@count += 1
  end

  def display
    puts "#{@name}: カウント = #{@@count}"
  end

  # クラスメソッド（self.メソッド名）
  def self.total_count
    @@count
  end

  def self.reset
    @@count = 0
  end
end

puts "\n--- クラス変数とインスタンス変数 ---"
c1 = Counter.new("カウンター1")
c1.display

c2 = Counter.new("カウンター2")
c1.display
c2.display

c3 = Counter.new("カウンター3")
c1.display
c2.display
c3.display

puts "\nクラスメソッドで総カウント取得: #{Counter.total_count}"

puts "\nカウンターをリセット"
Counter.reset
c1.display

puts "\n" + "=" * 50
puts "Example 3-2: User管理システムでのクラス変数"
puts "=" * 50

class User
  @@user_count = 0
  @@users = {}

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
    @@user_count += 1
    @@users[@name] = self
  end

  def self.total_users
    @@user_count
  end

  def self.find_user(name)
    @@users[name]
  end

  def self.all_users
    @@users.values
  end

  def info
    puts "名前: #{@name}, メール: #{@email}"
  end
end

puts "\n--- ユーザーを作成 ---"
user1 = User.new("太郎", "taro@example.com")
user2 = User.new("花子", "hanako@example.com")
user3 = User.new("次郎", "jiro@example.com")

puts "ユーザー総数: #{User.total_users}"

puts "\n--- ユーザー一覧 ---"
User.all_users.each { |u| u.info }

puts "\n--- 特定のユーザーを検索 ---"
found = User.find_user("花子")
found.info if found

puts "\n" + "=" * 50
puts "Example 3-3: クラスメソッドの活用"
puts "=" * 50

class Product
  @@product_count = 0
  @@products = []

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
    @@product_count += 1
    @@products << self
  end

  def self.count
    @@product_count
  end

  def self.total_value
    @@products.sum { |p| p.price }
  end

  def self.average_price
    return 0 if @@product_count == 0
    total_value / @@product_count.to_f
  end

  def self.most_expensive
    @@products.max_by { |p| p.price }
  end

  def self.cheapest
    @@products.min_by { |p| p.price }
  end

  def display
    puts "#{@name}: ¥#{@price}"
  end
end

puts "\n--- 商品を追加 ---"
Product.new("ノート", 500)
Product.new("ペン", 200)
Product.new("消しゴム", 150)
Product.new("定規", 300)

puts "商品数: #{Product.count}"
puts "合計価格: ¥#{Product.total_value}"
puts "平均価格: ¥#{Product.average_price.round(2)}"

puts "\n最も高い商品:"
Product.most_expensive.display

puts "\n最も安い商品:"
Product.cheapest.display

puts "\n" + "=" * 50
puts "Example 3-4: クラスメソッドの典型的な用途"
puts "=" * 50

class Article
  @@articles = []

  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end

  # クラスメソッド：全記事を取得
  def self.all
    @@articles
  end

  # クラスメソッド：記事を作成して登録
  def self.create(title, content)
    article = new(title, content)
    @@articles << article
    article
  end

  # クラスメソッド：タイトルから検索
  def self.find_by_title(title)
    @@articles.find { |a| a.title == title }
  end

  # クラスメソッド：すべてをリセット
  def self.clear
    @@articles = []
  end

  def display
    puts "タイトル: #{@title}"
    puts "本文: #{@content}"
    puts "---"
  end
end

puts "\n--- 記事を作成 ---"
Article.create("Ruby入門", "Rubyについて学ぼう")
Article.create("Rails講座", "Railsについて学ぼう")
Article.create("データベース", "SQLについて学ぼう")

puts "\n--- すべての記事 ---"
Article.all.each { |a| a.display }

puts "\n--- 特定の記事を検索 ---"
found = Article.find_by_title("Rails講座")
found&.display

puts "\n" + "=" * 50
puts "Example 3-5: インスタンスメソッドとクラスメソッド"
puts "=" * 50

class Bank
  @@total_balance = 0

  attr_reader :account_number, :balance

  def initialize(account_number, initial_balance)
    @account_number = account_number
    @balance = initial_balance
    @@total_balance += initial_balance
  end

  # インスタンスメソッド：入金
  def deposit(amount)
    @balance += amount
    @@total_balance += amount
    puts "入金: ¥#{amount} → 残高: ¥#{@balance}"
  end

  # インスタンスメソッド：出金
  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      @@total_balance -= amount
      puts "出金: ¥#{amount} → 残高: ¥#{@balance}"
    else
      puts "残高不足です"
    end
  end

  # クラスメソッド：全体の残高を取得
  def self.total_balance
    @@total_balance
  end

  def info
    puts "口座番号: #{@account_number}, 残高: ¥#{@balance}"
  end
end

puts "\n--- 銀行口座を作成 ---"
account1 = Bank.new("001", 10000)
account2 = Bank.new("002", 20000)

puts "\n--- 初期状態 ---"
account1.info
account2.info
puts "全体の残高: ¥#{Bank.total_balance}"

puts "\n--- 取引 ---"
account1.deposit(5000)
account2.withdraw(3000)

puts "\n--- 取引後 ---"
account1.info
account2.info
puts "全体の残高: ¥#{Bank.total_balance}"

puts "\n" + "=" * 50
puts "Example 3: 終了"
puts "=" * 50
