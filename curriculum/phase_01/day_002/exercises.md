# Day 2: 演習課題

## 演習1: ブロックを受け取るメソッドの作成

`repeat`メソッドを作成してください。このメソッドは回数を引数に取り、その回数だけブロックを実行します。

**要件:**
- 第1引数: 繰り返し回数
- ブロックを受け取る
- ブロックにカウンタ（1から始まる）を渡す

**使用例:**
```ruby
repeat(3) do |count|
  puts "#{count}回目の実行"
end

# 出力:
# 1回目の実行
# 2回目の実行
# 3回目の実行
```

`solutions/exercise1.rb`に実装してください。

---

## 演習2: Procを使った配列の変換

数値の配列に対して、複数の変換処理を適用できる`transform`メソッドを作成してください。

**要件:**
- 第1引数: 数値の配列
- 第2引数以降: 変換用のProc（可変長引数）
- すべてのProcを順番に適用した結果を返す

**使用例:**
```ruby
numbers = [1, 2, 3, 4, 5]
double = Proc.new { |x| x * 2 }
add_ten = Proc.new { |x| x + 10 }

result = transform(numbers, double, add_ten)
puts result.inspect
# => [12, 14, 16, 18, 20]
```

`solutions/exercise2.rb`に実装してください。

---

## 演習3: Lambdaを使ったフィルタリング

Lambdaを使って、配列から条件に合う要素を抽出する`filter_by`メソッドを作成してください。

**要件:**
- 第1引数: 配列
- 第2引数: フィルタ条件を表すLambda
- 条件に合う要素の配列を返す
- Lambdaでない場合はエラーを発生させる

**使用例:**
```ruby
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
is_even = ->(n) { n.even? }
greater_than_five = ->(n) { n > 5 }

puts filter_by(numbers, is_even).inspect
# => [2, 4, 6, 8, 10]

puts filter_by(numbers, greater_than_five).inspect
# => [6, 7, 8, 9, 10]
```

`solutions/exercise3.rb`に実装してください。

---

## 演習4: ProcとLambdaの違いを確認

以下の動作を確認するコードを書いてください。

1. Procは引数が少なくてもエラーにならないことを確認
2. Lambdaは引数が少ないとエラーになることを確認
3. Procのreturnがメソッド全体から抜けることを確認
4. Lambdaのreturnがラムダ自身から抜けるだけであることを確認

`solutions/exercise4.rb`に実装してください。

---

## 演習5: イテレータの総合演習

ユーザーデータの配列を操作する以下のメソッドを実装してください。

**データ:**
```ruby
users = [
  { id: 1, name: "太郎", age: 25, active: true, role: "admin" },
  { id: 2, name: "花子", age: 30, active: false, role: "user" },
  { id: 3, name: "次郎", age: 22, active: true, role: "user" },
  { id: 4, name: "三郎", age: 35, active: true, role: "admin" },
  { id: 5, name: "四郎", age: 28, active: false, role: "user" }
]
```

**実装するメソッド:**

1. `active_users(users)` - アクティブなユーザーの配列を返す
2. `user_names(users)` - 全ユーザーの名前の配列を返す
3. `average_age(users)` - 全ユーザーの平均年齢を返す（小数点第1位まで）
4. `admin_count(users)` - 管理者の人数を返す
5. `oldest_user(users)` - 最年長のユーザーを返す
6. `group_by_role(users)` - roleでグループ分けしたハッシュを返す

**使用例:**
```ruby
puts active_users(users).map { |u| u[:name] }.join(", ")
# => "太郎, 次郎, 三郎"

puts user_names(users).join(", ")
# => "太郎, 花子, 次郎, 三郎, 四郎"

puts average_age(users)
# => 28.0

puts admin_count(users)
# => 2

puts oldest_user(users)[:name]
# => "三郎"

p group_by_role(users).keys
# => ["admin", "user"]
```

`solutions/exercise5.rb`に実装してください。

---

## 演習6: ブロック、Proc、Lambdaを組み合わせる

以下の機能を持つ`Calculator`クラスを作成してください。

**要件:**
- 初期値を設定できる
- `apply`メソッドでブロックまたはProc/Lambdaを受け取り、現在の値に適用
- `result`メソッドで現在の値を返す
- メソッドチェーンが可能

**使用例:**
```ruby
calc = Calculator.new(10)

calc
  .apply { |x| x + 5 }
  .apply { |x| x * 2 }
  .apply { |x| x - 3 }

puts calc.result  # => 27

# Proc/Lambdaも使える
double = ->(x) { x * 2 }
add_ten = Proc.new { |x| x + 10 }

calc2 = Calculator.new(5)
calc2.apply(&double).apply(&add_ten)
puts calc2.result  # => 20
```

`solutions/exercise6.rb`に実装してください。

---

## チェックリスト

すべての演習を完了したら、以下を確認してください：

- [ ] 演習1: repeatメソッドが動作する
- [ ] 演習2: transformメソッドが動作する
- [ ] 演習3: filter_byメソッドが動作する
- [ ] 演習4: ProcとLambdaの違いを理解した
- [ ] 演習5: すべてのイテレータメソッドが動作する
- [ ] 演習6: Calculatorクラスが動作する

## 実行方法

```bash
# サンプルコードの実行
ruby examples/01_blocks.rb
ruby examples/02_proc.rb
ruby examples/03_lambda.rb
ruby examples/04_proc_vs_lambda.rb
ruby examples/05_iterators.rb

# 演習の実行
ruby solutions/exercise1.rb
ruby solutions/exercise2.rb
ruby solutions/exercise3.rb
ruby solutions/exercise4.rb
ruby solutions/exercise5.rb
ruby solutions/exercise6.rb
```

## 完了後

すべての演習を完了し、理解できたらDay 3に進みましょう！
