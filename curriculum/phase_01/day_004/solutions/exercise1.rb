#!/usr/bin/env ruby
# Day 4: Exercise 1 - sendメソッドの活用

class Controller
  def index
    "全件表示"
  end

  def show
    "詳細表示"
  end

  def create
    "新規作成"
  end

  def update
    "更新"
  end

  def delete
    "削除"
  end

  def route(action)
    method_name = action.to_sym
    if respond_to?(method_name)
      send(method_name)
    else
      "エラー：アクション '#{action}' が見つかりません"
    end
  end
end

# テスト
if __FILE__ == $0
  controller = Controller.new

  puts "--- ルーティング ---"
  puts "index: #{controller.route('index')}"
  puts "show: #{controller.route('show')}"
  puts "create: #{controller.route('create')}"
  puts "update: #{controller.route('update')}"
  puts "delete: #{controller.route('delete')}"

  puts "\n--- 不正なアクション ---"
  puts controller.route('invalid')
  puts controller.route('unknown')
end
