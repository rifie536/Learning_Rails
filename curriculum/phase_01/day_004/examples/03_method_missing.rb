#!/usr/bin/env ruby
# Day 4: Example 3 - method_missing

puts "=" * 50
puts "Example 3: method_missing"
puts "=" * 50

# 定義されていないメソッドの呼び出しをキャッチ
class DynamicObject
  def method_missing(method_name, *args)
    puts "呼ばれたメソッド: #{method_name}"
    puts "引数: #{args.inspect}"
    "method_missing: このメソッドは定義されていません"
  end
end

puts "\n--- method_missingの基本 ---"
obj = DynamicObject.new
puts obj.hello
puts obj.greet("太郎")

puts "\n" + "=" * 50
puts "Example 3-2: method_missingでデータベースクエリをシミュレート"
puts "=" * 50

class User
  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
  end

  def method_missing(method_name, *args)
    # find_by_XXX パターンをサポート
    if method_name.to_s.start_with?("find_by_")
      attribute = method_name.to_s.sub("find_by_", "")
      value = args.first

      case attribute
      when "name"
        return "ユーザーを名前で検索: #{value}"
      when "email"
        return "ユーザーをメールで検索: #{value}"
      when "age"
        return "ユーザーを年齢で検索: #{value}"
      end
    end

    super
  end
end

puts "\n--- find_by_XXXメソッド ---"
puts User.find_by_name("太郎")
puts User.find_by_email("taro@example.com")
puts User.find_by_age(25)

puts "\n" + "=" * 50
puts "Example 3-3: ハッシュライクなオブジェクト"
puts "=" * 50

class HashObject
  def initialize(data)
    @data = data
  end

  def method_missing(method_name, *args)
    key = method_name.to_sym

    if @data.key?(key)
      @data[key]
    else
      "キー '#{key}' は存在しません"
    end
  end
end

puts "\n--- ハッシュをメソッドのように扱う ---"
user_data = {
  name: "太郎",
  email: "taro@example.com",
  age: 25
}

user = HashObject.new(user_data)
puts "名前: #{user.name}"
puts "メール: #{user.email}"
puts "年齢: #{user.age}"
puts "住所: #{user.address}"

puts "\n" + "=" * 50
puts "Example 3-4: method_missingでマジックメソッド"
puts "=" * 50

class MagicObject
  def method_missing(method_name, *args)
    method_str = method_name.to_s

    # ?で終わっている場合
    if method_str.end_with?("?")
      return "これは#{method_str}に答える魔法です"
    end

    # !で終わっている場合
    if method_str.end_with?("!")
      return "これは#{method_str}を実行する魔法です"
    end

    # _を含んでいる場合
    if method_str.include?("_")
      return "これは#{method_str}という複合メソッドです"
    end

    "呼ばれたメソッド: #{method_name}"
  end
end

puts "\n--- マジックメソッド ---"
magic = MagicObject.new
puts magic.is_valid?
puts magic.execute!
puts magic.send_email
puts magic.get_user_by_id

puts "\n" + "=" * 50
puts "Example 3-5: APIレスポンスオブジェクト"
puts "=" * 50

class ApiResponse
  def initialize(data)
    @data = data
  end

  def method_missing(method_name, *args)
    # ネストされたデータへのアクセス
    if @data.is_a?(Hash) && @data.key?(method_name.to_sym)
      value = @data[method_name.to_sym]
      return value.is_a?(Hash) ? ApiResponse.new(value) : value
    end

    "属性 '#{method_name}' は見つかりません"
  end
end

puts "\n--- APIレスポンス ---"
api_data = {
  user: {
    name: "太郎",
    email: "taro@example.com",
    profile: {
      age: 25,
      city: "東京"
    }
  }
}

response = ApiResponse.new(api_data)
puts "ユーザー名: #{response.user.name}"
puts "メール: #{response.user.email}"
puts "年齢: #{response.user.profile.age}"
puts "都市: #{response.user.profile.city}"

puts "\n" + "=" * 50
puts "Example 3-6: respond_to_missing?（重要）"
puts "=" * 50

class SmartObject
  def method_missing(method_name, *args)
    if method_name.to_s.start_with?("get_")
      return "#{method_name}メソッドの結果"
    end
    super
  end

  # respond_to?で動的メソッドの存在を教える
  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?("get_") || super
  end
end

puts "\n--- respond_to_missing? ---"
obj = SmartObject.new
puts obj.respond_to?(:get_user)
puts obj.respond_to?(:invalid_method)

puts "\nメソッド実行:"
puts obj.get_user

puts "\n" + "=" * 50
puts "Example 3-7: method_missingの注意点"
puts "=" * 50

class SlowObject
  def method_missing(method_name, *args)
    puts "method_missingが呼ばれています（遅い）"
    "結果"
  end

  # 同じ効果だが、define_methodで定義する方が高速
  define_method(:fast_method) do
    puts "定義されたメソッド（高速）"
    "結果"
  end
end

puts "\n--- パフォーマンス比較 ---"
obj = SlowObject.new

puts "遅い方法（毎回method_missing）:"
10.times { obj.send(:slow_method) }

puts "\n高速な方法（事前定義）:"
10.times { obj.fast_method }

puts "\n" + "=" * 50
puts "Example 3: 終了"
puts "=" * 50
