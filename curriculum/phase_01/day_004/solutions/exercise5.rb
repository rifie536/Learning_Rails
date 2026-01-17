#!/usr/bin/env ruby
# Day 4: Exercise 5 - イベントシステムの構築

class EventEmitter
  def initialize
    @listeners = {}
  end

  def on(event_name, &block)
    @listeners[event_name] ||= []
    @listeners[event_name] << block
    self
  end

  def off(event_name)
    @listeners.delete(event_name)
    self
  end

  def emit(event_name, *args)
    listeners = @listeners[event_name] || []
    listeners.each do |listener|
      listener.call(*args)
    end
  end

  def listener_count(event_name)
    (@listeners[event_name] || []).length
  end
end

# テスト
if __FILE__ == $0
  puts "--- 基本的なイベント ---"
  emitter = EventEmitter.new

  emitter.on(:greeting) do |name|
    puts "こんにちは、#{name}さん！"
  end

  emitter.on(:greeting) do |name|
    puts "お疲れ様です、#{name}さん"
  end

  emitter.emit(:greeting, "太郎")

  puts "\n--- 複数のパラメータ ---"
  emitter.on(:user_created) do |id, name, email|
    puts "ユーザー作成: ID=#{id}, 名前=#{name}, メール=#{email}"
  end

  emitter.emit(:user_created, 1, "花子", "hanako@example.com")

  puts "\n--- リスナー数の確認 ---"
  puts "greeting のリスナー数: #{emitter.listener_count(:greeting)}"
  puts "user_created のリスナー数: #{emitter.listener_count(:user_created)}"

  puts "\n--- メソッドチェーン ---"
  emitter2 = EventEmitter.new

  emitter2
    .on(:event1) { puts "event1 リスナー1" }
    .on(:event1) { puts "event1 リスナー2" }
    .on(:event2) { puts "event2 リスナー" }

  puts "Event1 を発火:"
  emitter2.emit(:event1)

  puts "\nEvent2 を発火:"
  emitter2.emit(:event2)

  puts "\n--- リスナーの削除 ---"
  emitter2.off(:event1)
  puts "event1 のリスナー数: #{emitter2.listener_count(:event1)}"
  puts "event1 を発火（リスナーなし）:"
  emitter2.emit(:event1)
end
