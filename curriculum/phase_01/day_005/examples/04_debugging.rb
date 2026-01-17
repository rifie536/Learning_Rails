#!/usr/bin/env ruby
# Day 5: Example 4 - デバッグツール

puts "=" * 50
puts "Example 4: Rubyのデバッグ技法"
puts "=" * 50

# デバッグ技法1: puts での出力
puts "\n--- 1. puts での基本的な出力 ---"

x = 10
y = 20
sum = x + y

puts "x = #{x}"
puts "y = #{y}"
puts "sum = #{sum}"

# デバッグ技法2: p での詳細出力
puts "\n--- 2. p での詳細な出力 ---"

array = [1, 2, 3, 4, 5]
hash = { name: "太郎", age: 25 }

puts "配列:"
p array  # [1, 2, 3, 4, 5] と表示（inspect の結果）

puts "ハッシュ:"
p hash   # {:name=>"太郎", :age=>25} と表示

# 複数の変数を一度に確認
p x, y, sum

# デバッグ技法3: pp での整形出力
puts "\n--- 3. pp での整形出力 ---"

require "pp"

complex_data = {
  user: {
    name: "太郎",
    email: "taro@example.com",
    profile: {
      age: 25,
      city: "東京"
    }
  },
  posts: [
    { id: 1, title: "Ruby入門" },
    { id: 2, title: "Rails講座" }
  ]
}

puts "複雑なデータ構造："
pp complex_data

# デバッグ技法4: inspect
puts "\n--- 4. inspect メソッド ---"

name = "Ruby"
num = 42
nil_value = nil

puts "name.inspect = #{name.inspect}"     # => "Ruby"（文字列）
puts "num.inspect = #{num.inspect}"       # => 42
puts "nil_value.inspect = #{nil_value.inspect}"  # => nil

# 手動でデバッグ文を記述
class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def display
    puts "ユーザー: #{@name} (#{@age}歳)"
  end
end

puts "\n--- 5. オブジェクトのデバッグ ---"

user = User.new("太郎", 25)

# デバッグ出力
puts "user class: #{user.class}"
puts "user.name: #{user.name}"
puts "user.age: #{user.age}"

# デバッグの痕跡を残す
puts "DEBUG: user の状態 = #{user.inspect}"
puts "DEBUG: 実行位置 #{__FILE__}:#{__LINE__}"

# デバッグ技法6: raise でエラーメッセージ付き例外
puts "\n--- 6. raise でデバッグ情報を出力 ---"

def calculate(x, y)
  if y == 0
    raise "エラー: yは0以外である必要があります (x=#{x}, y=#{y})"
  end
  x / y
end

begin
  result = calculate(10, 2)
  puts "10 / 2 = #{result}"

  result = calculate(10, 0)
rescue => e
  puts "例外キャッチ: #{e.message}"
end

# デバッグ技法7: デバッグ用ハッシュ確認
puts "\n--- 7. ハッシュの詳細確認 ---"

user_hash = {
  id: 1,
  name: "太郎",
  email: "taro@example.com",
  roles: ["user", "admin"],
  settings: {
    notifications: true,
    theme: "dark"
  }
}

puts "キー一覧:"
p user_hash.keys

puts "\n値一覧:"
p user_hash.values

puts "\nキーと値のペア:"
user_hash.each do |key, value|
  puts "  #{key}: #{value.inspect}"
end

# デバッグ技法8: 実行時間の測定
puts "\n--- 8. 実行時間の測定 ---"

require "benchmark"

time = Benchmark.measure do
  sum = 0
  (1..1000000).each { |i| sum += i }
end

puts "計算時間: #{time.real.round(4)}秒"

# または
start_time = Time.now
(1..1000000).each { |i| i }
end_time = Time.now

puts "別の計算時間: #{(end_time - start_time).round(4)}秒"

# デバッグ技法9: スタックトレース
puts "\n--- 9. スタックトレース ---"

def level3
  puts "level3 で例外を発生"
  raise "エラーが発生しました"
end

def level2
  level3
end

def level1
  level2
end

begin
  level1
rescue => e
  puts "エラーメッセージ: #{e.message}"
  puts "\nスタックトレース:"
  e.backtrace.each { |line| puts "  #{line}" }
end

# デバッグ技法10: 条件付きデバッグ
puts "\n--- 10. 条件付きデバッグ ---"

DEBUG = ENV["DEBUG"] == "true"

def process_data(data)
  puts "DEBUG: データ受け取り: #{data.inspect}" if DEBUG

  result = data * 2

  puts "DEBUG: 計算結果: #{result}" if DEBUG

  result
end

puts "DEBUGモード OFF:"
result = process_data(5)

# DEBUG環境変数を設定してテスト
ENV["DEBUG"] = "true"
puts "\nDEBUGモード ON:"
result = process_data(10)

# デバッグ技法11: ログ出力
puts "\n--- 11. ログレベル ---"

class Logger
  DEBUG = 0
  INFO = 1
  WARN = 2
  ERROR = 3

  def initialize(level = INFO)
    @level = level
  end

  def debug(message)
    puts "[DEBUG] #{message}" if @level <= DEBUG
  end

  def info(message)
    puts "[INFO] #{message}" if @level <= INFO
  end

  def warn(message)
    puts "[WARN] #{message}" if @level <= WARN
  end

  def error(message)
    puts "[ERROR] #{message}" if @level <= ERROR
  end
end

logger = Logger.new(Logger::DEBUG)
logger.debug("詳細情報")
logger.info("情報")
logger.warn("警告")
logger.error("エラー")

puts "\n" + "=" * 50
puts "デバッグのベストプラクティス"
puts "=" * 50
puts %{
1. puts/p で簡単な確認
   - puts: 文字列に変換して出力
   - p: inspect の結果を出力

2. pp で複雑なデータ構造を確認
   - ハッシュ、配列の整形表示

3. 実行時間の測定
   - Benchmark.measure
   - Time.now での計測

4. スタックトレースで呼び出し元を確認
   - e.backtrace

5. 条件付きデバッグ
   - if DEBUG
   - 本番環境では出力しない

6. ログレベルの使い分け
   - DEBUG: 最も詳細
   - INFO: 情報
   - WARN: 警告
   - ERROR: エラー

7. binding.pry（別途ジェムが必要）
   - REPL で変数を対話的に確認
   - gem pry-rails をインストール

8. byebug（Rubyに組込）
   - ステップ実行
   - ブレークポイント設定
   - debugger の利用
}

puts "\n" + "=" * 50
puts "Example 4: 終了"
puts "=" * 50
