#!/usr/bin/env ruby
# Day 4: Exercise 4 - バリデーション機能

class Validator
  def self.validates(attr_name, options = {})
    # バリデーションルールを保存
    @validations ||= []
    @validations << { attr: attr_name, options: options }

    # ゲッター
    define_method(attr_name) do
      @attributes ||= {}
      @attributes[attr_name]
    end

    # セッター
    define_method("#{attr_name}=") do |value|
      @attributes ||= {}
      @attributes[attr_name] = value
    end

    # バリデーションメソッド
    define_method("validate_#{attr_name}") do
      value = instance_variable_get("@attributes") ? @attributes[attr_name] : nil

      errors = []

      # 必須チェック
      if options[:presence] && (value.nil? || value.to_s.empty?)
        errors << "#{attr_name} は必須です"
      end

      # 文字列長チェック
      if options[:length] && value && value.to_s.length > options[:length]
        errors << "#{attr_name} は#{options[:length]}文字以内です"
      end

      # 正規表現マッチ
      if options[:format] && value && !value.to_s.match?(options[:format])
        errors << "#{attr_name} の形式が不正です"
      end

      # 数値チェック
      if options[:numericality] && value && !value.to_s.match?(/\A\d+\z/)
        errors << "#{attr_name} は数値である必要があります"
      end

      errors
    end
  end

  def self.validations
    @validations || []
  end

  def initialize(*values)
    @attributes = {}
  end

  def validate
    errors = []
    self.class.validations.each do |rule|
      method_name = "validate_#{rule[:attr]}"
      if respond_to?(method_name)
        errors.concat(send(method_name))
      end
    end
    errors
  end
end

class Person < Validator
  validates :name, presence: true, length: 50
  validates :email, presence: true, format: /@/
  validates :age, numericality: true
end

class Product < Validator
  validates :name, presence: true, length: 100
  validates :price, numericality: true
  validates :code, format: /\A[A-Z0-9]+\z/
end

# テスト
if __FILE__ == $0
  puts "--- Person バリデーション ---"
  person1 = Person.new
  person1.name = "太郎"
  person1.email = "taro@example.com"
  person1.age = "25"

  errors = person1.validate
  puts "有効: #{errors.empty? ? 'OK' : errors.join(', ')}"

  puts "\n--- 無効なデータ ---"
  person2 = Person.new
  person2.name = ""
  person2.email = "invalid"
  person2.age = "abc"

  errors = person2.validate
  puts "エラー:"
  errors.each { |e| puts "- #{e}" }

  puts "\n--- Product バリデーション ---"
  product1 = Product.new
  product1.name = "ノート"
  product1.price = "500"
  product1.code = "PROD001"

  errors = product1.validate
  puts "有効: #{errors.empty? ? 'OK' : errors.join(', ')}"

  puts "\n--- Product の無効なデータ ---"
  product2 = Product.new
  product2.name = "ペン"
  product2.price = "500"
  product2.code = "prod001"  # 小文字は不正

  errors = product2.validate
  puts "エラー:"
  errors.each { |e| puts "- #{e}" }
end
