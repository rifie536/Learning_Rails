#!/usr/bin/env ruby
# Day 5: Exercise Solutions - デバッグ実践

puts "=" * 60
puts "演習4: Calculator デバッグ（ZeroDivisionError の対応）"
puts "=" * 60

class Calculator
  def initialize(value)
    @value = value
    puts "DEBUG: Calculator 初期化 - value = #{@value.inspect}"
  end

  def add(n)
    puts "DEBUG: add(#{n.inspect}) 実行 - 前の値: #{@value}"
    @value = @value + n
    puts "DEBUG: add 実行後 - 新しい値: #{@value}"
    @value
  end

  def multiply(n)
    puts "DEBUG: multiply(#{n.inspect}) 実行 - 前の値: #{@value}"
    @value = @value * n
    puts "DEBUG: multiply 実行後 - 新しい値: #{@value}"
    @value
  end

  def divide(n)
    puts "DEBUG: divide(#{n.inspect}) 実行 - 前の値: #{@value}"

    # バグ修正: n が 0 でないか確認
    if n.zero?
      puts "DEBUG: エラー - n が 0 です！"
      raise "エラー: 0 で除算することはできません"
    end

    @value = @value / n
    puts "DEBUG: divide 実行後 - 新しい値: #{@value}"
    @value
  end

  def result
    puts "DEBUG: result() 呼び出し - 現在の値: #{@value}"
    @value
  end

  def reset
    puts "DEBUG: reset() 実行"
    @value = 0
  end
end

# テスト実行
puts "\n--- テスト1: 正常系 ---"
calc = Calculator.new(10)
puts calc.add(5)       # => 15
puts calc.multiply(2)  # => 30
puts calc.divide(5)    # => 6
puts "最終結果: #{calc.result}"

puts "\n--- テスト2: ZeroDivisionError を処理 ---"
calc2 = Calculator.new(10)
begin
  puts calc2.divide(0)  # エラーが発生
rescue => e
  puts "キャッチした例外: #{e.class} - #{e.message}"
end

puts "\n" + "=" * 60
puts "演習5: UserManager デバッグ"
puts "=" * 60

class User
  attr_accessor :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end

  def inspect
    "#<User id=#{@id}, name=#{@name.inspect}, email=#{@email.inspect}>"
  end

  def to_s
    "User(#{@id}): #{@name} <#{@email}>"
  end
end

class UserManager
  def initialize
    @users = []
    puts "DEBUG: UserManager 初期化"
  end

  def add_user(id, name, email)
    puts "DEBUG: add_user(id=#{id}, name=#{name.inspect}, email=#{email.inspect})"

    # バグ修正: 重複チェック
    if @users.any? { |u| u.id == id }
      puts "DEBUG: エラー - ID #{id} は既に存在します"
      raise "エラー: ユーザーID #{id} は既に存在します"
    end

    user = User.new(id, name, email)
    @users << user
    puts "DEBUG: ユーザー追加完了 - 現在のユーザー数: #{@users.length}"
    puts "DEBUG: 全ユーザー: #{@users.inspect}"
  end

  def find_by_id(id)
    puts "DEBUG: find_by_id(#{id}) 実行"

    user = @users.find { |u| u.id == id }

    puts "DEBUG: 検索結果: #{user.inspect}"
    user
  end

  def find_by_email(email)
    puts "DEBUG: find_by_email(#{email.inspect}) 実行"

    user = @users.find { |u| u.email == email }

    puts "DEBUG: 検索結果: #{user.inspect}"
    user
  end

  def all_users
    puts "DEBUG: all_users() - ユーザー数: #{@users.length}"
    @users.dup
  end

  def remove_user(id)
    puts "DEBUG: remove_user(#{id}) 実行 - 削除前: #{@users.length}人"

    initial_count = @users.length
    @users.delete_if { |u| u.id == id }

    puts "DEBUG: 削除後: #{@users.length}人（#{initial_count - @users.length}人削除）"
  end

  def user_count
    @users.length
  end
end

# テスト実行
puts "\n--- テスト: ユーザー管理 ---"
manager = UserManager.new

puts "\n--- ユーザー追加 ---"
manager.add_user(1, "太郎", "taro@example.com")
manager.add_user(2, "花子", "hanako@example.com")
manager.add_user(3, "次郎", "jiro@example.com")

puts "\n--- ユーザー検索 ---"
user = manager.find_by_email("taro@example.com")
puts "検索結果: #{user}"
puts "名前: #{user.name}"

puts "\n--- ユーザー削除 ---"
manager.remove_user(2)
removed = manager.find_by_email("hanako@example.com")
puts "削除確認（nil?）: #{removed.nil?}"

puts "\n--- ユーザー数確認 ---"
puts "現在のユーザー数: #{manager.user_count}"
puts "期待値: 2"

puts "\n--- 全ユーザー表示 ---"
puts "管理者が知っているユーザー:"
manager.all_users.each { |u| puts "  - #{u}" }

# ボーナステスト: 重複登録の防止
puts "\n--- テスト: 重複登録の防止 ---"
begin
  manager.add_user(1, "太郎2", "taro2@example.com")  # ID 1 は既存
rescue => e
  puts "期待通りのエラー: #{e.message}"
end

puts "\n" + "=" * 60
puts "デバッグの重要ポイント"
puts "=" * 60
puts """
1. DEBUG出力を活用
   - puts で値を出力
   - p で詳細な情報を出力
   - pp で整形表示

2. エラーハンドリング
   - raise で意図的にエラーを発生させる
   - begin/rescue で例外をキャッチ
   - 適切なエラーメッセージを提供

3. 状態の確認
   - オブジェクトの現在の状態を把握
   - 期待値との違いを確認
   - ステップごとにチェック

4. 検証
   - assert や raise で条件チェック
   - バリデーション後に操作
   - テストケースを追加

5. 実装のコツ
   - 小さく、シンプルにテスト
   - 一度に一つのことをチェック
   - 予期しない入力に備える
"""

puts "\n" + "=" * 60
puts "すべてのテストが完了しました"
puts "=" * 60
