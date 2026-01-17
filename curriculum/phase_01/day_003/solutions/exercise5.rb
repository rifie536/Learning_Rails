#!/usr/bin/env ruby
# Day 3: Exercise 5 - ミックスインを使った機能追加

module Publishable
  def publish
    @published = true
    puts "#{self.class.name}が公開されました"
  end

  def unpublish
    @published = false
    puts "#{self.class.name}が非公開になりました"
  end

  def published?
    @published || false
  end
end

module Commentable
  def add_comment(text)
    @comments ||= []
    @comments << text
    puts "コメントを追加しました"
  end

  def comments
    @comments || []
  end

  def comment_count
    comments.length
  end
end

class Post
  include Publishable
  include Commentable

  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
    @published = false
    @comments = []
  end

  def display
    status = @published ? "公開" : "非公開"
    puts "タイトル: #{@title}"
    puts "本文: #{@content}"
    puts "ステータス: #{status}"
    puts "コメント数: #{comment_count}"
  end
end

# テスト
if __FILE__ == $0
  post = Post.new("Ruby入門", "Rubyについて学びましょう")

  puts "--- 初期状態 ---"
  post.display

  puts "\n--- コメント追加 ---"
  post.add_comment("良い記事ですね")
  post.add_comment("参考になりました")
  post.add_comment("ありがとう")

  puts "\n--- コメント確認 ---"
  puts "公開状態? #{post.published?}"
  puts "コメント数: #{post.comment_count}"

  puts "\n--- 記事を公開 ---"
  post.publish
  post.display

  puts "\n--- すべてのコメント ---"
  post.comments.each_with_index do |comment, index|
    puts "#{index + 1}. #{comment}"
  end

  puts "\n--- 記事を非公開 ---"
  post.unpublish
  puts "公開状態? #{post.published?}"
end
