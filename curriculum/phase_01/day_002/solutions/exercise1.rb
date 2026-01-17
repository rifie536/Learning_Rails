#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習1: ブロックを受け取るrepeatメソッド

def repeat(count, &block)
  count.times do |i|
    block.call(i + 1) # 1から始まるカウンタを渡す
  end
end

# テスト
puts "=== 演習1: repeatメソッド ==="
repeat(3) do |count|
  puts "#{count}回目の実行"
end

puts "\n別の例:"
repeat(5) do |num|
  puts "* " * num
end
