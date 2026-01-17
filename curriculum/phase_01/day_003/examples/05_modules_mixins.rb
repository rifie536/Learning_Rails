#!/usr/bin/env ruby
# Day 3: Example 5 - モジュールとミックスイン

puts "=" * 50
puts "Example 5: モジュールとミックスイン"
puts "=" * 50

# モジュールの定義
module Walkable
  def walk
    puts "#{@name}は歩いている"
  end

  def run
    puts "#{@name}は走っている"
  end
end

module Swimmable
  def swim
    puts "#{@name}は泳いでいる"
  end
end

module Flyable
  def fly
    puts "#{@name}は飛んでいる"
  end
end

# モジュールをincludeで混ぜ込む
class Person
  attr_accessor :name
  include Walkable  # Walkableモジュールを混ぜ込む

  def initialize(name)
    @name = name
  end
end

class Duck
  attr_accessor :name
  include Walkable  # 複数のモジュールを混ぜ込める
  include Swimmable
  include Flyable

  def initialize(name)
    @name = name
  end
end

puts "\n--- Person（歩く人） ---"
person = Person.new("太郎")
person.walk
person.run

puts "\n--- Duck（歩いて、泳いで、飛ぶ） ---"
duck = Duck.new("ドナルド")
duck.walk
duck.swim
duck.fly

puts "\n" + "=" * 50
puts "Example 5-2: includeとextendの違い"
puts "=" * 50

module Loggable
  def log(message)
    puts "[LOG] #{message}"
  end
end

class App
  # includeはインスタンスメソッドを追加
  include Loggable
end

puts "\n--- includeの使用 ---"
app = App.new
app.log("アプリケーション開始")

# クラスメソッドとして使いたい場合
class Logger
  # extendはクラスメソッドを追加
  extend Loggable
end

puts "\n--- extendの使用 ---"
Logger.log("ロガー初期化")

puts "\n" + "=" * 50
puts "Example 5-3: モジュールでの共通処理"
puts "=" * 50

# 日時を扱うモジュール
module Timestampable
  def set_timestamp
    @created_at = Time.now
    @updated_at = Time.now
  end

  def update_timestamp
    @updated_at = Time.now
  end

  def show_timestamp
    puts "作成: #{@created_at}"
    puts "更新: #{@updated_at}"
  end
end

class Article
  attr_accessor :title
  include Timestampable

  def initialize(title)
    @title = title
    set_timestamp
  end

  def update(new_title)
    @title = new_title
    update_timestamp
  end

  def display
    puts "記事: #{@title}"
    show_timestamp
  end
end

puts "\n--- Article ---"
article = Article.new("Ruby入門")
article.display

puts "\n--- 記事を更新 ---"
sleep(1)
article.update("Ruby入門（改訂版）")
article.display

puts "\n" + "=" * 50
puts "Example 5-4: モジュールで複数の機能を提供"
puts "=" * 50

module Comparable
  def equal_to?(other)
    self == other
  end

  def greater_than?(other)
    self > other
  end

  def less_than?(other)
    self < other
  end
end

class Version
  attr_accessor :major, :minor, :patch
  include Comparable

  def initialize(major, minor, patch)
    @major = major
    @minor = minor
    @patch = patch
  end

  def to_s
    "#{@major}.#{@minor}.#{@patch}"
  end

  def <=>(other)
    [@major, @minor, @patch] <=> [other.major, other.minor, other.patch]
  end
end

puts "\n--- Version比較 ---"
v1 = Version.new(1, 2, 3)
v2 = Version.new(1, 2, 3)
v3 = Version.new(1, 3, 0)

puts "v1: #{v1}"
puts "v2: #{v2}"
puts "v3: #{v3}"

puts "\nv1とv2が等しい? #{v1.equal_to?(v2)}"
puts "v3がv1より大きい? #{v3.greater_than?(v1)}"
puts "v1がv3より小さい? #{v1.less_than?(v3)}"

puts "\n" + "=" * 50
puts "Example 5-5: モジュールでの検証処理"
puts "=" * 50

module Validatable
  def valid?
    true
  end

  def validate
    raise "未実装" unless respond_to?(:validate!)
    validate!
  end
end

class Email
  include Validatable
  attr_accessor :address

  def initialize(address)
    @address = address
  end

  def validate!
    if @address.include?("@")
      puts "有効なメールアドレス: #{@address}"
    else
      puts "無効なメールアドレス: #{@address}"
    end
  end
end

puts "\n--- メール検証 ---"
email1 = Email.new("taro@example.com")
email1.validate

email2 = Email.new("invalid-email")
email2.validate

puts "\n" + "=" * 50
puts "Example 5-6: 複数のモジュールの組み合わせ（Railsのように）"
puts "=" * 50

module Serializable
  def to_json
    "{\"#{self.class.name}\":{}}"
  end

  def to_hash
    {}
  end
end

module Persistable
  def save
    puts "#{self.class.name}を保存しました"
  end

  def delete
    puts "#{self.class.name}を削除しました"
  end
end

module Queryable
  def self.find(id)
    puts "#{self}でIDを検索: #{id}"
  end

  def self.all
    puts "#{self}のすべてを取得"
  end
end

class User
  include Serializable
  include Persistable

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_hash
    { name: @name, email: @email }
  end
end

puts "\n--- User（複数のモジュール） ---"
user = User.new("太郎", "taro@example.com")
puts "JSON: #{user.to_json}"
puts "Hash: #{user.to_hash}"
user.save
user.delete

puts "\n" + "=" * 50
puts "Example 5-7: includeの順序"
puts "=" * 50

module A
  def greet
    puts "モジュールA: こんにちは"
  end
end

module B
  def greet
    puts "モジュールB: おはよう"
  end
end

class Class1
  include A
  include B
end

class Class2
  include B
  include A
end

puts "\n--- Class1（A先にinclude）---"
Class1.new.greet

puts "\n--- Class2（B先にinclude）---"
Class2.new.greet

puts "\n" + "=" * 50
puts "Example 5-8: モジュール内でのメソッド定義"
puts "=" * 50

module Taggable
  def add_tag(tag)
    @tags ||= []
    @tags << tag
  end

  def tags
    @tags || []
  end

  def has_tag?(tag)
    tags.include?(tag)
  end
end

class Post
  include Taggable
  attr_accessor :title

  def initialize(title)
    @title = title
  end
end

puts "\n--- Post with Tags ---"
post = Post.new("Ruby入門")
post.add_tag("ruby")
post.add_tag("programming")
post.add_tag("tutorial")

puts "記事: #{post.title}"
puts "タグ: #{post.tags.join(", ")}"
puts "'ruby'タグを持っている? #{post.has_tag?('ruby')}"
puts "'python'タグを持っている? #{post.has_tag?('python')}"

puts "\n" + "=" * 50
puts "Example 5: 終了"
puts "=" * 50
