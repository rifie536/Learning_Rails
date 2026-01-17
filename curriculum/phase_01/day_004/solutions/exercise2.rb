#!/usr/bin/env ruby
# Day 4: Exercise 2 - define_methodでアクセサの自動生成

class Model
  def self.columns(*names)
    @column_names = names

    names.each do |name|
      # ゲッター
      define_method(name) do
        @attributes ||= {}
        @attributes[name]
      end

      # セッター
      define_method("#{name}=") do |value|
        @attributes ||= {}
        @attributes[name] = value
      end
    end
  end

  def self.column_names
    @column_names || []
  end

  def initialize(*values)
    @attributes = {}
    column_names = self.class.column_names
    values.each_with_index do |value, index|
      if index < column_names.length
        @attributes[column_names[index]] = value
      end
    end
  end

  def attributes
    @attributes || {}
  end

  def inspect
    attrs = attributes.map { |k, v| "#{k}: #{v.inspect}" }.join(", ")
    "#<#{self.class.name} #{attrs}>"
  end
end

class User < Model
  columns :name, :email, :age
end

class Post < Model
  columns :title, :content, :author
end

# テスト
if __FILE__ == $0
  puts "--- User クラス ---"
  user = User.new("太郎", "taro@example.com", 25)
  puts user.inspect
  puts "名前: #{user.name}"
  puts "メール: #{user.email}"
  puts "年齢: #{user.age}"

  puts "\n--- 属性を変更 ---"
  user.age = 26
  puts "更新後の年齢: #{user.age}"
  puts user.inspect

  puts "\n--- Post クラス ---"
  post = Post.new("Ruby入門", "Rubyについて学びましょう", "太郎")
  puts post.inspect
  puts "タイトル: #{post.title}"
  puts "本文: #{post.content}"
  puts "著者: #{post.author}"

  puts "\n--- attributes メソッド ---"
  puts "ユーザーの属性: #{user.attributes}"
end
