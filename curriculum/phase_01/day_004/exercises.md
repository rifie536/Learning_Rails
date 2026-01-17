# Day 4: 演習課題

## 演習1: sendメソッドの活用

以下の要件に従ってメソッドルーターを実装してください。

**要件:**
- Controller クラスを作成
- index、show、create、update、delete メソッドを持つ
- route(action) メソッドで、アクションに対応するメソッドを実行
- 存在しないアクションの場合はエラーメッセージを表示

**使用例:**
```ruby
controller = Controller.new
controller.route("index")    # => "全件表示"
controller.route("show")     # => "詳細表示"
controller.route("create")   # => "新規作成"
controller.route("invalid")  # => "エラー：アクションが見つかりません"
```

`solutions/exercise1.rb`に実装してください。

---

## 演習2: define_methodでアクセサの自動生成

以下の要件に従ってModelクラスを作成してください。

**要件:**
- Model 親クラスを作成
- columns(*names) クラスメソッドでアクセサを自動生成
- initialize で複数の値を受け取り初期化
- attributes ハッシュで すべての属性を保持

**使用例:**
```ruby
class User < Model
  columns :name, :email, :age
end

user = User.new("太郎", "taro@example.com", 25)
puts user.name      # => "太郎"
puts user.email     # => "taro@example.com"

user.age = 26
puts user.age       # => 26
```

`solutions/exercise2.rb`に実装してください。

---

## 演習3: method_missingでfind_by_XXX実装

以下の要件に従ってRepositoryクラスを作成してください。

**要件:**
- initialize で データの配列を受け取る
- `find_by_XXX` パターンのメソッドをサポート
- find_by_name("太郎") のように呼び出す
- マッチしたデータを返す（複数の場合は最初の1件）
- respond_to_missing? も実装

**使用例:**
```ruby
users = [
  { id: 1, name: "太郎", email: "taro@example.com" },
  { id: 2, name: "花子", email: "hanako@example.com" }
]

repo = UserRepository.new(users)
puts repo.find_by_name("太郎")[:email]  # => "taro@example.com"
puts repo.find_by_id(2)[:name]          # => "花子"
```

`solutions/exercise3.rb`に実装してください。

---

## 演習4: バリデーション機能

以下の要件に従ってValidatorを実装してください。

**要件:**
- 親クラス Validator を作成
- validates クラスメソッドで複数のバリデーションルールを登録
- presence: true（必須チェック）
- length: n（文字列長チェック）
- format: /regex/（正規表現マッチ）
- numericality: true（数値チェック）
- validate メソッドですべてのバリデーションを実行
- エラーの配列を返す

**使用例:**
```ruby
class Person < Validator
  validates :name, presence: true, length: 50
  validates :email, presence: true, format: /@/
  validates :age, numericality: true
end

person = Person.new("太郎", "taro@example.com", "25")
errors = person.validate
puts errors.empty? ? "OK" : errors.join(", ")
```

`solutions/exercise4.rb`に実装してください。

---

## 演習5: イベントシステムの構築

以下の要件に従ってEventEmitterを実装してください。

**要件:**
- EventEmitter クラスを作成
- on(event_name, &block) でイベントリスナーを登録
- emit(event_name, *args) でイベントを発火
-複数のリスナーを登録可能
- define_method で動的にメソッドを作成

**使用例:**
```ruby
emitter = EventEmitter.new

emitter.on(:user_created) do |user_name|
  puts "ユーザー作成: #{user_name}"
end

emitter.on(:user_created) do |user_name|
  puts "ログ記録: #{user_name}が作成されました"
end

emitter.emit(:user_created, "太郎")
# => ユーザー作成: 太郎
# => ログ記録: 太郎が作成されました
```

`solutions/exercise5.rb`に実装してください。

---

## 演習6: DSL（Domain Specific Language）でクエリビルダ

以下の要件に従ってQueryBuilderを実装してください。

**要件:**
- QueryBuilder クラスを作成
- where(column, value) でフィルタリング条件を追加
- order_by(column) でソート条件を追加
- limit(n) で件数制限を追加
- execute で条件に合うデータを返す
- メソッドチェーン可能

**使用例:**
```ruby
users = [
  { id: 1, name: "太郎", age: 25, active: true },
  { id: 2, name: "花子", age: 30, active: false },
  { id: 3, name: "次郎", age: 28, active: true }
]

result = QueryBuilder.new(users)
  .where(:age, lambda { |v| v > 25 })
  .order_by(:age, :asc)
  .limit(2)
  .execute

puts result[0][:name]  # => "次郎"
puts result[1][:name]  # => "花子"
```

`solutions/exercise6.rb`に実装してください。

---

## チェックリスト

すべての演習を完了したら、以下を確認してください：

- [ ] 演習1: sendメソッドが動作する
- [ ] 演習2: define_methodでアクセサが自動生成される
- [ ] 演習3: method_missingでfind_by_XXXが動作する
- [ ] 演習4: バリデーション機能が動作する
- [ ] 演習5: イベントシステムが動作する
- [ ] 演習6: クエリビルダが動作する

## 実行方法

```bash
# サンプルコードの実行
ruby examples/01_send.rb
ruby examples/02_define_method.rb
ruby examples/03_method_missing.rb
ruby examples/04_eval.rb
ruby examples/05_practical_examples.rb

# 演習の実行
ruby solutions/exercise1.rb
ruby solutions/exercise2.rb
ruby solutions/exercise3.rb
ruby solutions/exercise4.rb
ruby solutions/exercise5.rb
ruby solutions/exercise6.rb
```

## 完了後

すべての演習を完了し、理解できたら Day 5 に進みましょう！
