#!/usr/bin/env ruby
# Day 4: Example 4 - eval（注意：危険）

puts "=" * 50
puts "Example 4: eval（文字列からコードを実行）"
puts "=" * 50

# evalの基本
puts "\n--- evalの基本 ---"
code = "2 + 3"
result = eval(code)
puts "eval('2 + 3') = #{result}"

code = "puts 'これはevalで実行されました'"
eval(code)

puts "\n" + "=" * 50
puts "Example 4-2: evalで変数を使う"
puts "=" * 50

x = 10
y = 20

code = "x + y"
result = eval(code)
puts "eval('x + y') = #{result}"

# evalは現在のスコープにアクセスできる
code = "z = x * y"
eval(code)
puts "定義された変数z = #{z}"

puts "\n" + "=" * 50
puts "Example 4-3: evalで簡単な計算機を実装"
puts "=" * 50

def simple_calculator(expression)
  result = eval(expression)
  puts "#{expression} = #{result}"
  result
end

puts "\n--- 計算機 ---"
simple_calculator("5 + 3")
simple_calculator("10 * 4")
simple_calculator("100 / 5")

puts "\n" + "=" * 50
puts "Example 4-4: evalで動的に条件判定"
puts "=" * 50

def check_condition(value, condition)
  result = eval(condition)
  puts "値: #{value}, 条件: #{condition} => #{result}"
  result
end

puts "\n--- 条件判定 ---"
age = 25
check_condition(age, "age >= 20")
check_condition(age, "age < 18")

name = "太郎"
check_condition(name, "name == '太郎'")

puts "\n" + "=" * 50
puts "Example 4-5: evalの危険性 - セキュリティ問題"
puts "=" * 50

puts "\n--- evalの危険な例 ---"

# ユーザー入力（悪意のあるコード）
user_input = "system('echo 悪意のあるコード')"

puts "ユーザー入力: #{user_input}"
puts "これをevalで実行することは非常に危険です！"
puts "（ここでは実行しません）"

# 実際には以下のような危険な処理が起こる
# eval(user_input)  # 絶対に実行しないこと！

puts "\n--- evalで何でもできてしまう ---"
# ファイルの削除
puts "eval('File.delete(\"important_file.txt\")') のような危険がある"

# システムコマンドの実行
puts "eval('`rm -rf /`') のような危険がある"

# プライベート変数へのアクセス
puts "eval('@secret_password') のようにプライベート変数にアクセスされる危険がある"

puts "\n" + "=" * 50
puts "Example 4-6: evalの代替案 - より安全な方法"
puts "=" * 50

# 方法1: sendメソッド
puts "\n--- sendメソッドを使う（より安全） ---"
class MathHelper
  def add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

helper = MathHelper.new
operation = :add
result = helper.send(operation, 5, 3)
puts "send(:add, 5, 3) = #{result}"

# 方法2: case文で許可された操作のみ
puts "\n--- case文で制御する（より安全） ---"
def safe_calculator(expression)
  case expression
  when "add"
    5 + 3
  when "multiply"
    5 * 3
  when "subtract"
    5 - 3
  else
    "不明な操作"
  end
end

puts "safe_calculator('add') = #{safe_calculator('add')}"
puts "safe_calculator('multiply') = #{safe_calculator('multiply')}"

puts "\n" + "=" * 50
puts "Example 4-7: evalの限定的な使用"
puts "=" * 50

# どうしても必要な場合の限定的な使用例

# ホワイトリスト方式
def validate_and_eval(user_input)
  # ホワイトリストで許可した文字のみ
  allowed_chars = /\A[\d+\-*\/\(\)\s]+\z/

  unless allowed_chars.match?(user_input)
    raise "不正な入力"
  end

  begin
    eval(user_input)
  rescue => e
    puts "エラー: #{e.message}"
  end
end

puts "\n--- ホワイトリスト方式の計算 ---"
puts "5 + 3 = #{validate_and_eval('5 + 3')}"
puts "10 * 2 = #{validate_and_eval('10 * 2')}"

begin
  validate_and_eval("system('echo hack')")
rescue => e
  puts "エラーでブロック: #{e.message}"
end

puts "\n" + "=" * 50
puts "重要な注意"
puts "=" * 50
puts """
evalの使用は避けるべき！

✓ 使うべき代替案：
  - sendメソッド
  - case/if文で許可した操作のみ実行
  - JSON.parse（データのパース）
  - YAML.safe_load（安全なYAML読み込み）

✗ evalを使ってはいけない場合：
  - ユーザー入力を直接eval
  - 外部から取得したデータをeval
  - セキュリティが重要なコード

Railsも eval の使用を最小限に抑えています。
"""

puts "\n" + "=" * 50
puts "Example 4: 終了"
puts "=" * 50
