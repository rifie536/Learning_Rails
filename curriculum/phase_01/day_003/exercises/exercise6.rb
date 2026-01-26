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

# TODO: ここにTweetクラスを実装してください



# TODO: ここにUserクラスを実装してください



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
