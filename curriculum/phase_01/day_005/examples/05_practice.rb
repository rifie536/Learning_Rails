#!/usr/bin/env ruby
# Day 5: Example 5 - 実践的なデバッグ例

puts "=" * 50
puts "Example 5: 実践的なデバッグ例"
puts "=" * 50

# シナリオ1: バグのあるコード（重複がある）
puts "\n--- シナリオ1: ユーザー管理システムのバグ ---"

class UserManager
  def initialize
    @users = []
  end

  def add_user(name, email)
    puts "DEBUG: add_user('#{name}', '#{email}') が呼ばれました"

    # バグ: 同じメールアドレスが重複登録されている
    @users << { name: name, email: email }

    puts "DEBUG: ユーザー数 = #{@users.length}"
    puts "DEBUG: 全ユーザー = #{@users.inspect}"
  end

  def find_by_email(email)
    puts "DEBUG: find_by_email('#{email}') を実行"

    user = @users.find { |u| u[:email] == email }

    puts "DEBUG: 検索結果 = #{user.inspect}"
    user
  end

  def users_count
    @users.length
  end

  def list_users
    puts "現在のユーザー一覧:"
    @users.each_with_index do |user, index|
      puts "  #{index + 1}. #{user[:name]} (#{user[:email]})"
    end
  end
end

manager = UserManager.new
manager.add_user("太郎", "taro@example.com")
manager.add_user("花子", "hanako@example.com")
manager.add_user("太郎", "taro@example.com")  # 重複登録

puts "\nユーザー数: #{manager.users_count}"
puts "期待値: 2, 実際: #{manager.users_count} ← バグ！"

manager.list_users

puts "\n" + "=" * 50
puts "シナリオ2: 計算ロジックのバグ"
puts "=" * 50

class Order
  attr_accessor :items, :discount

  def initialize
    @items = []
    @discount = 0
  end

  def add_item(name, price, quantity)
    puts "DEBUG: アイテム追加 - #{name}, 価格: #{price}円, 数量: #{quantity}"

    item = { name: name, price: price, quantity: quantity }
    @items << item

    subtotal = price * quantity
    puts "DEBUG: 小計 = #{price} × #{quantity} = #{subtotal}円"
  end

  def subtotal
    total = @items.sum { |item| item[:price] * item[:quantity] }
    puts "DEBUG: subtotal = #{total}"
    total
  end

  def total_with_discount
    sub = subtotal
    discounted = sub * (1 - @discount / 100.0)

    puts "DEBUG: discount = #{@discount}%"
    puts "DEBUG: sub = #{sub}, discounted = #{discounted}"

    discounted
  end

  def display_summary
    puts "=== 注文サマリー ==="
    @items.each do |item|
      amount = item[:price] * item[:quantity]
      puts "#{item[:name]}: #{item[:price]}円 × #{item[:quantity]}個 = #{amount}円"
    end

    puts "小計: #{subtotal}円"

    if @discount > 0
      discount_amount = subtotal * (@discount / 100.0)
      puts "割引(#{@discount}%): -#{discount_amount.round}円"
      puts "合計: #{total_with_discount.round}円"
    else
      puts "合計: #{subtotal}円"
    end
  end
end

order = Order.new
order.add_item("りんご", 200, 3)
order.add_item("みかん", 150, 4)
order.add_item("バナナ", 100, 2)

puts "\n--- 割引なし ---"
order.display_summary

puts "\n--- 10%割引 ---"
order.discount = 10
order.display_summary

puts "\n" + "=" * 50
puts "シナリオ3: データ型の混合"
puts "=" * 50

class DataProcessor
  def process_numbers(input)
    puts "DEBUG: input = #{input.inspect} (class: #{input.class})"

    # バグ: 文字列と数値が混在している
    numbers = input.map do |item|
      puts "DEBUG: 処理中 - #{item.inspect} (class: #{item.class})"

      # 文字列なら数値に変換
      if item.is_a?(String)
        value = item.to_i
      else
        value = item
      end

      puts "DEBUG: 変換後 - #{value}"
      value
    end

    puts "DEBUG: 結果 = #{numbers.inspect}"
    numbers
  end

  def calculate_average(numbers)
    puts "DEBUG: 入力 = #{numbers.inspect}"

    # バグの可能性：空の配列の処理
    if numbers.empty?
      puts "DEBUG: 空の配列です"
      return 0
    end

    sum = numbers.sum
    average = sum.to_f / numbers.length

    puts "DEBUG: sum = #{sum}, count = #{numbers.length}, average = #{average}"

    average
  end
end

processor = DataProcessor.new

# テストデータ
data = ["10", 20, "30", 40, "50"]
puts "テストデータ: #{data.inspect}"

numbers = processor.process_numbers(data)
average = processor.calculate_average(numbers)

puts "\n平均値: #{average.round(2)}"

puts "\n" + "=" * 50
puts "シナリオ4: ループのバグ"
puts "=" * 50

class CollectionProcessor
  def filter_and_sum(numbers, threshold)
    puts "DEBUG: filter_and_sum(#{numbers.inspect}, threshold=#{threshold})"

    sum = 0
    count = 0

    numbers.each do |num|
      puts "DEBUG: チェック中 - #{num}"

      if num > threshold
        puts "DEBUG: #{num} は #{threshold} より大きい → 追加"
        sum += num
        count += 1
      else
        puts "DEBUG: #{num} は #{threshold} 以下 → スキップ"
      end
    end

    puts "DEBUG: 合計 = #{sum}, カウント = #{count}"

    {
      sum: sum,
      count: count,
      average: count > 0 ? sum.to_f / count : 0
    }
  end
end

processor2 = CollectionProcessor.new
numbers = [5, 10, 15, 20, 25]

result = processor2.filter_and_sum(numbers, 12)

puts "\n結果:"
puts "  合計: #{result[:sum]}"
puts "  件数: #{result[:count]}"
puts "  平均: #{result[:average].round(2)}"

puts "\n" + "=" * 50
puts "デバッグテクニック総まとめ"
puts "=" * 50
puts """
1. 入力値のデバッグ
   - puts/p で入力値を確認
   - 型も一緒に確認（.class を使用）

2. 計算ステップのデバッグ
   - 各ステップの結果を出力
   - 変数の変化を追跡

3. ループのデバッグ
   - ループ内で各イテレーションを出力
   - 条件分岐の結果を確認

4. コレクションのデバッグ
   - 長さ/要素数を確認
   - 空かどうかをチェック

5. 最終結果の確認
   - 期待値と実際の値を比較
   - デバッグ出力で違いを見つける

実務でのデバッグ:
- 本番環境ではデバッグ出力は削除
- ログレベルを使い分ける
- テストコードでも回帰を防ぐ
- binding.pry でインタラクティブに確認
"""

puts "\n" + "=" * 50
puts "Example 5: 終了"
puts "=" * 50
