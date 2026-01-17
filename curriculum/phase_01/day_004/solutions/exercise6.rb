#!/usr/bin/env ruby
# Day 4: Exercise 6 - DSLでクエリビルダ

class QueryBuilder
  def initialize(records)
    @records = records
    @filters = []
    @order_config = nil
    @limit_count = nil
  end

  def where(column, condition = nil, &block)
    filter = if block_given?
               ->(record) { block.call(record[column]) }
             elsif condition.is_a?(Proc)
               ->(record) { condition.call(record[column]) }
             else
               ->(record) { record[column] == condition }
             end

    @filters << filter
    self
  end

  def order_by(column, direction = :asc)
    @order_config = { column: column, direction: direction }
    self
  end

  def limit(count)
    @limit_count = count
    self
  end

  def execute
    result = @records.dup

    # フィルタリング
    @filters.each do |filter|
      result = result.select { |record| filter.call(record) }
    end

    # ソート
    if @order_config
      column = @order_config[:column]
      direction = @order_config[:direction]

      result.sort! do |a, b|
        comparison = a[column] <=> b[column]
        direction == :asc ? comparison : -comparison
      end
    end

    # リミット
    result = result.take(@limit_count) if @limit_count

    result
  end
end

# テスト
if __FILE__ == $0
  puts "--- サンプルデータ ---"
  users = [
    { id: 1, name: "太郎", age: 25, active: true },
    { id: 2, name: "花子", age: 30, active: false },
    { id: 3, name: "次郎", age: 28, active: true },
    { id: 4, name: "三郎", age: 35, active: true },
    { id: 5, name: "四郎", age: 22, active: false }
  ]

  puts "--- 全件 ---"
  QueryBuilder.new(users).execute.each do |u|
    puts "#{u[:name]}: #{u[:age]}歳"
  end

  puts "\n--- age > 25 でフィルタ ---"
  result = QueryBuilder.new(users)
    .where(:age) { |age| age > 25 }
    .execute

  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }

  puts "\n--- active == true でフィルタ ---"
  result = QueryBuilder.new(users)
    .where(:active, true)
    .execute

  result.each { |u| puts "#{u[:name]}: アクティブ" }

  puts "\n--- 複数フィルタ ---"
  result = QueryBuilder.new(users)
    .where(:active, true)
    .where(:age) { |age| age >= 28 }
    .execute

  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }

  puts "\n--- ソート ---"
  result = QueryBuilder.new(users)
    .order_by(:age, :asc)
    .execute

  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }

  puts "\n--- 年齢降順 ---"
  result = QueryBuilder.new(users)
    .order_by(:age, :desc)
    .execute

  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }

  puts "\n--- リミット ---"
  result = QueryBuilder.new(users)
    .order_by(:age, :asc)
    .limit(2)
    .execute

  puts "最年少の2人:"
  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }

  puts "\n--- メソッドチェーン（複数条件＋ソート＋リミット） ---"
  result = QueryBuilder.new(users)
    .where(:active, true)
    .where(:age) { |age| age > 22 }
    .order_by(:age, :desc)
    .limit(2)
    .execute

  puts "アクティブで、22歳より上で、年齢降順、最大2件:"
  result.each { |u| puts "#{u[:name]}: #{u[:age]}歳" }
end
