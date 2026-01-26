#!/usr/bin/env ruby
# frozen_string_literal: true

# 演習1: sendメソッドの活用
#
# 以下の要件に従ってメソッドルーターを実装してください。
#
# 要件:
# - Controller クラスを作成
# - index、show、create、update、delete メソッドを持つ
# - route(action) メソッドで、アクションに対応するメソッドを実行
# - 存在しないアクションの場合はエラーメッセージを表示
#
# 使用例:
# controller = Controller.new
# controller.route("index")    # => "全件表示"
# controller.route("show")     # => "詳細表示"
# controller.route("create")   # => "新規作成"
# controller.route("invalid")  # => "エラー：アクションが見つかりません"

# TODO: ここにControllerクラスを実装してください
# ヒント: send メソッドと respond_to? メソッドを使用します


# テストコード
puts "=== 演習1: sendメソッドの活用 ==="
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
