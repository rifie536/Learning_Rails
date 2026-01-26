#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習5: イベントシステムの構築
#
# 以下の要件に従ってEventEmitterを実装してください。
#
# 要件:
# - EventEmitter クラスを作成
# - on(event_name, &block) でイベントリスナーを登録
# - emit(event_name, *args) でイベントを発火
# - 複数のリスナーを登録可能
# - define_method で動的にメソッドを作成
#
# 使用例:
# emitter = EventEmitter.new
#
# emitter.on(:user_created) do |user_name|
#   puts "ユーザー作成: #{user_name}"
# end
#
# emitter.on(:user_created) do |user_name|
#   puts "ログ記録: #{user_name}が作成されました"
# end
#
# emitter.emit(:user_created, "太郎")
# # => ユーザー作成: 太郎
# # => ログ記録: 太郎が作成されました

# TODO: ここにEventEmitterクラスを実装してください
# ヒント: ハッシュでイベント名とブロックの配列を管理します


# テストコード
puts "=== 演習5: イベントシステムの構築 ==="

emitter = EventEmitter.new

# ユーザー作成イベントのリスナーを登録
emitter.on(:user_created) do |user_name|
  puts "📧 メール送信: #{user_name}さん、登録ありがとうございます"
end

emitter.on(:user_created) do |user_name|
  puts "📝 ログ記録: #{user_name}が#{Time.now}に登録されました"
end

emitter.on(:user_created) do |user_name|
  puts "🎉 ウェルカムメッセージ: ようこそ、#{user_name}さん！"
end

# イベントを発火
puts "\nユーザー「太郎」を作成:"
emitter.emit(:user_created, "太郎")

puts "\n" + "=" * 50

# 別のイベント
emitter.on(:purchase_completed) do |user, item|
  puts "💰 #{user}さんが#{item}を購入しました"
end

emitter.on(:purchase_completed) do |user, item|
  puts "📦 #{item}の配送準備を開始します"
end

puts "\n購入イベント:"
emitter.emit(:purchase_completed, "花子", "Ruby入門書")
