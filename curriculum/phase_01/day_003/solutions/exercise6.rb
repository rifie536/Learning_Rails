#!/usr/bin/env ruby
# Day 3: Exercise 6 - 統合演習 - Twitterライクなシステム

module Hashtagable
  def add_hashtag(tag)
    @hashtags ||= []
    @hashtags << tag unless @hashtags.include?(tag)
  end

  def hashtags
    @hashtags || []
  end
end

class Tweet
  include Hashtagable

  attr_accessor :content
  attr_reader :author, :created_at, :likes

  def initialize(author, content)
    @author = author
    @content = content
    @created_at = Time.now
    @likes = 0
    @liked_by = Set.new
    @hashtags = []
  end

  def like
    @likes += 1
  end

  def like_by(user_name)
    unless @liked_by.include?(user_name)
      @liked_by.add(user_name)
      like
    end
  end

  def liked_by?(user_name)
    @liked_by.include?(user_name)
  end

  def display
    puts "---"
    puts "著者: #{@author}"
    puts "内容: #{@content}"
    puts "作成: #{@created_at.strftime('%Y-%m-%d %H:%M:%S')}"
    puts "いいね: #{@likes}"
    puts "ハッシュタグ: #{hashtags.map { |t| "##{t}" }.join(", ")}" unless hashtags.empty?
    puts "---"
  end
end

class User
  attr_accessor :name, :bio

  def initialize(name, bio)
    @name = name
    @bio = bio
    @tweets = []
  end

  def post_tweet(content)
    tweet = Tweet.new(@name, content)
    @tweets << tweet
    tweet
  end

  def tweets
    @tweets
  end

  def like_tweet(tweet)
    tweet.like_by(@name)
    puts "#{@name}がいいねしました"
  end

  def display_tweets
    puts "=== #{@name}のツイート ==="
    @tweets.each { |tweet| tweet.display }
  end
end

# テスト
if __FILE__ == $0
  user1 = User.new("太郎", "Ruby好き")
  user2 = User.new("花子", "Rails開発者")
  user3 = User.new("次郎", "プログラミング初心者")

  puts "=== ユーザー情報 ==="
  puts "名前: #{user1.name}, 自己紹介: #{user1.bio}"
  puts "名前: #{user2.name}, 自己紹介: #{user2.bio}"

  puts "\n=== ツイート投稿 ==="
  tweet1 = user1.post_tweet("Rubyは素晴らしい言語です")
  tweet1.add_hashtag("ruby")
  tweet1.add_hashtag("programming")

  tweet2 = user2.post_tweet("Railsでアプリを開発中！")
  tweet2.add_hashtag("rails")
  tweet2.add_hashtag("web")

  tweet3 = user1.post_tweet("今日はプログラミング頑張った")
  tweet3.add_hashtag("programming")
  tweet3.add_hashtag("daily")

  puts "\n=== ツイート表示 ==="
  tweet1.display
  tweet2.display
  tweet3.display

  puts "\n=== いいね機能 ==="
  user2.like_tweet(tweet1)
  user3.like_tweet(tweet1)
  user1.like_tweet(tweet2)

  puts "\n=== いいね確認 ==="
  puts "ツイート1: #{tweet1.likes}いいね"
  puts "花子にいいねされている? #{tweet1.liked_by?('花子')}"
  puts "次郎にいいねされている? #{tweet1.liked_by?('次郎')}"

  puts "\n=== ユーザーのツイート一覧 ==="
  user1.display_tweets
  user2.display_tweets
end
