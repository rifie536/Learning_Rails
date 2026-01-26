#!/usr/bin/env ruby
# Day 3: Exercise 1 - Bookクラスの作成

class Book
  attr_accessor :title, :author, :pages

  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
  end

  def display
    puts "タイトル: #{@title}"
    puts "著者: #{@author}"
    puts "ページ数: #{@pages}"
  end

  def read_percentage(pages_read)
    (pages_read.to_f / @pages * 100).round(1)
  end
end

# テスト
if __FILE__ == $0
  book = Book.new("Ruby入門", "太郎", 300)
  book.display

  puts "\n読んだページ数: 75"
  puts "進捗率: #{book.read_percentage(75)}%"

  puts "\n--- タイトルを更新 ---"
  book.title = "改訂版Ruby入門"
  book.display

  puts "\n--- 150ページ読んだ場合 ---"
  puts "進捗率: #{book.read_percentage(150)}%"
end
