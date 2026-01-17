#!/usr/bin/env ruby
# Day 4: Exercise 3 - method_missingでfind_by_XXX実装

class Repository
  def initialize(records)
    @records = records
  end

  def method_missing(method_name, *args)
    # find_by_XXX パターンをサポート
    if method_name.to_s.start_with?("find_by_")
      column = method_name.to_s.sub("find_by_", "")
      value = args.first

      @records.find { |record| record[column.to_sym] == value }
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?("find_by_") || super
  end
end

class UserRepository < Repository
end

class ProductRepository < Repository
end

# テスト
if __FILE__ == $0
  puts "--- UserRepository ---"
  users = [
    { id: 1, name: "太郎", email: "taro@example.com", age: 25 },
    { id: 2, name: "花子", email: "hanako@example.com", age: 30 },
    { id: 3, name: "次郎", email: "jiro@example.com", age: 28 }
  ]

  user_repo = UserRepository.new(users)

  user1 = user_repo.find_by_name("太郎")
  puts "find_by_name('太郎'): #{user1}"

  user2 = user_repo.find_by_id(2)
  puts "find_by_id(2): #{user2}"

  user3 = user_repo.find_by_email("jiro@example.com")
  puts "find_by_email('jiro@example.com'): #{user3[:name]}"

  not_found = user_repo.find_by_name("不在")
  puts "find_by_name('不在'): #{not_found.inspect}"

  puts "\n--- ProductRepository ---"
  products = [
    { id: 1, name: "ノート", price: 500 },
    { id: 2, name: "ペン", price: 200 },
    { id: 3, name: "消しゴム", price: 150 }
  ]

  product_repo = ProductRepository.new(products)

  product = product_repo.find_by_name("ノート")
  puts "find_by_name('ノート'): #{product}"

  product2 = product_repo.find_by_price(200)
  puts "find_by_price(200): #{product2[:name]}"

  puts "\n--- respond_to_missing ---"
  puts "user_repo.respond_to?(:find_by_name): #{user_repo.respond_to?(:find_by_name)}"
  puts "user_repo.respond_to?(:find_by_age): #{user_repo.respond_to?(:find_by_age)}"
  puts "user_repo.respond_to?(:invalid_method): #{user_repo.respond_to?(:invalid_method)}"
end
