#!/usr/bin/env ruby
# Day 4: Example 5 - メタプログラミングの実践例

puts "=" * 50
puts "Example 5: メタプログラミングの実践例"
puts "=" * 50

# 例1: ActiveRecord風のORMライク実装
puts "\n--- 例1: ORM的なモデル実装 ---"

class Model
  def self.attr_columns(*names)
    names.each do |name|
      define_method(name) do
        @attributes ||= {}
        @attributes[name]
      end

      define_method("#{name}=") do |value|
        @attributes ||= {}
        @attributes[name] = value
      end
    end
  end
end

class Post < Model
  attr_columns :title, :content, :author

  def initialize(title, content, author)
    @attributes = {}
    self.title = title
    self.content = content
    self.author = author
  end

  def display
    puts "---"
    puts "タイトル: #{title}"
    puts "本文: #{content}"
    puts "著者: #{author}"
    puts "---"
  end
end

post = Post.new("Ruby入門", "Rubyについて学びましょう", "太郎")
post.display
post.author = "太郎田中"
post.display

puts "\n" + "=" * 50
puts "例2: バリデーション機能（Railsのvalidates風）"
puts "=" * 50

class ValidatedModel
  def self.validates(attr_name, options = {})
    define_method("validate_#{attr_name}") do
      value = instance_variable_get("@#{attr_name}")

      if options[:presence] && (value.nil? || value.empty?)
        return "#{attr_name} は必須です"
      end

      if options[:length] && value.length > options[:length]
        return "#{attr_name} は#{options[:length]}文字以内です"
      end

      if options[:format] && !value.match?(options[:format])
        return "#{attr_name} の形式が不正です"
      end

      nil
    end
  end

  def validate
    errors = []
    methods.select { |m| m.to_s.start_with?("validate_") }.each do |method|
      error = send(method)
      errors << error if error
    end
    errors
  end
end

class User < ValidatedModel
  validates :name, presence: true, length: 50
  validates :email, presence: true, format: /@/

  def initialize(name, email)
    @name = name
    @email = email
  end
end

puts "\n--- バリデーションテスト ---"
user1 = User.new("太郎", "taro@example.com")
puts "有効なユーザー:"
puts user1.validate.empty? ? "OK" : user1.validate

user2 = User.new("", "invalid-email")
puts "\n無効なユーザー:"
puts user2.validate

puts "\n" + "=" * 50
puts "例3: スコープ機能（Railsのscope風）"
puts "=" * 50

class QueryBuilder
  def initialize(records)
    @records = records
  end

  def self.scope(name, &block)
    define_method(name) do
      QueryBuilder.new(@records.select { |r| block.call(r) })
    end
  end

  def each
    @records.each { |r| yield r }
  end
end

class Article < QueryBuilder
  def initialize(records)
    @records = records || []
  end

  scope :published, -> (article) { article[:published] }
  scope :recent, -> (article) { article[:days] < 30 }
end

articles = [
  { title: "Ruby入門", published: true, days: 5 },
  { title: "下書き", published: false, days: 10 },
  { title: "Rails講座", published: true, days: 50 },
  { title: "新しい記事", published: true, days: 2 }
]

puts "\n--- スコープの使用 ---"
article_repo = Article.new(articles)

puts "公開された記事:"
article_repo.published.each { |a| puts "- #{a[:title]}" }

puts "\n30日以内の記事:"
article_repo.recent.each { |a| puts "- #{a[:title]}" }

puts "\n" + "=" * 50
puts "例4: コールバック機能（Railsのbefore_save風）"
puts "=" * 50

class CallbackModel
  class << self
    attr_reader :callbacks
  end

  @callbacks = {}

  def self.before_save(&block)
    @callbacks[:before_save] ||= []
    @callbacks[:before_save] << block
  end

  def self.after_save(&block)
    @callbacks[:after_save] ||= []
    @callbacks[:after_save] << block
  end

  def save
    run_callbacks(:before_save)
    puts "保存中..."
    run_callbacks(:after_save)
  end

  private

  def run_callbacks(callback_name)
    callbacks = self.class.instance_variable_get("@callbacks") || {}
    (callbacks[callback_name] || []).each do |callback|
      instance_exec(&callback)
    end
  end
end

class Product < CallbackModel
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  before_save do
    puts "保存前：データをバリデート"
  end

  after_save do
    puts "保存後：ログを出力"
  end
end

puts "\n--- コールバックの実行 ---"
product = Product.new("ノート", 500)
product.save

puts "\n" + "=" * 50
puts "例5: DSL（Domain Specific Language）の構築"
puts "=" * 50

class FormBuilder
  def initialize
    @fields = []
  end

  def text_field(name, options = {})
    @fields << { type: :text, name: name, label: options[:label] }
  end

  def email_field(name, options = {})
    @fields << { type: :email, name: name, label: options[:label] }
  end

  def password_field(name, options = {})
    @fields << { type: :password, name: name, label: options[:label] }
  end

  def submit(label)
    @fields << { type: :submit, label: label }
  end

  def build
    html = "<form>\n"
    @fields.each do |field|
      case field[:type]
      when :text, :email, :password
        html += "  <label>#{field[:label]}</label>\n"
        html += "  <input type=\"#{field[:type]}\" name=\"#{field[:name]}\">\n"
      when :submit
        html += "  <button type=\"submit\">#{field[:label]}</button>\n"
      end
    end
    html += "</form>"
    html
  end
end

puts "\n--- DSLでフォーム生成 ---"
form = FormBuilder.new
form.text_field :name, label: "名前"
form.email_field :email, label: "メール"
form.password_field :password, label: "パスワード"
form.submit "ログイン"

puts form.build

puts "\n" + "=" * 50
puts "例6: 動的なリレーション"
puts "=" * 50

class HasManyBuilder
  def initialize(parent_class, child_class)
    @parent_class = parent_class
    @child_class = child_class
  end

  def define_relations
    child_class = @child_class
    define_method("#{child_class.to_s.downcase}s") do
      @relations ||= {}
      @relations[child_class] ||= []
    end

    define_method("add_#{child_class.to_s.downcase}") do |obj|
      send("#{child_class.to_s.downcase}s") << obj
    end
  end
end

class Author
  attr_accessor :name
  attr_reader :books

  def initialize(name)
    @name = name
    @books = []
  end

  def add_book(book)
    @books << book
  end
end

class Book
  attr_accessor :title, :author

  def initialize(title)
    @title = title
  end
end

puts "\n--- 動的なリレーション ---"
author = Author.new("太郎")
author.add_book(Book.new("Ruby入門"))
author.add_book(Book.new("Rails講座"))

puts "著者: #{author.name}"
puts "著書:"
author.books.each { |b| puts "- #{b.title}" }

puts "\n" + "=" * 50
puts "Example 5: 終了"
puts "=" * 50
