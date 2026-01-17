# Day 3: 演習課題

## 演習1: Bookクラスの作成

次の要件に従ってBookクラスを作成してください。

**要件:**
- 初期化：`title`（タイトル）、`author`（著者）、`pages`（ページ数）を受け取る
- `attr_accessor`を使用してすべての属性に読み書きができる
- `display`メソッド：情報を整形して表示する
- `read_percentage`メソッド：読んだページ数を引数に取り、進捗率を返す

**使用例:**
```ruby
book = Book.new("Ruby入門", "太郎", 300)
book.display
# 出力:
# タイトル: Ruby入門
# 著者: 太郎
# ページ数: 300

puts book.read_percentage(75)
# => 25.0

book.title = "改訂版Ruby入門"
book.display
```

`solutions/exercise1.rb`に実装してください。

---

## 演習2: Bank（銀行口座）クラス

Bank クラスを作成してください。

**要件:**
- 初期化：`account_number`（口座番号）、`owner`（名義人）、`balance`（残高）を受け取る
- `account_number`と`owner`は読み込み専用（attr_reader）
- `balance`は読み書き可能（attr_accessor）ただし、直接書き込みはできず、以下のメソッドでのみ変更可能
- `deposit(amount)`：入金処理
- `withdraw(amount)`：出金処理（残高不足の場合はエラーメッセージ）
- `info`メソッド：口座情報を表示

**使用例:**
```ruby
account = Bank.new("12345", "太郎", 10000)
account.info
# 口座番号: 12345, 名義人: 太郎, 残高: 10000円

account.deposit(5000)
account.info
# 口座番号: 12345, 名義人: 太郎, 残高: 15000円

account.withdraw(3000)
account.info
# 口座番号: 12345, 名義人: 太郎, 残高: 12000円

account.withdraw(20000)  # エラーメッセージを表示
```

`solutions/exercise2.rb`に実装してください。

---

## 演習3: クラス変数を使った会社管理システム

Employee クラスを作成してください。

**要件:**
- インスタンス変数：`name`（名前）、`department`（部署）、`salary`（給与）
- クラス変数：`@@employee_count`（従業員数）、`@@total_salary`（総給与）
- 初期化時に従業員数をカウント、総給与を加算
- `self.total_employees`：従業員数を返すクラスメソッド
- `self.average_salary`：平均給与を返すクラスメソッド
- `self.raise_all_salary(percent)`：全従業員の給与をパーセンテージ分上げるクラスメソッド

**使用例:**
```ruby
emp1 = Employee.new("太郎", "営業", 300000)
emp2 = Employee.new("花子", "企画", 350000)
emp3 = Employee.new("次郎", "技術", 400000)

puts Employee.total_employees
# => 3

puts Employee.average_salary
# => 350000.0

Employee.raise_all_salary(10)
puts emp1.salary  # => 330000
puts Employee.average_salary
# => 385000.0
```

`solutions/exercise3.rb`に実装してください。

---

## 演習4: 継承を使ったゲームキャラクター

以下の継承階層でキャラクターシステムを作成してください。

```
Character（親クラス）
├── Warrior（戦士）
├── Mage（魔法使い）
└── Healer（回復職）
```

**Character クラスの要件:**
- 初期化：`name`（名前）、`hp`（体力）、`mp`（魔力）を受け取る
- `attack`メソッド：ダメージ量を返す（子クラスでオーバーライド）
- `take_damage(damage)`：ダメージを受ける
- `status`メソッド：ステータスを表示

**子クラスの要件:**
- Warrior：attack で30ダメージ返す
- Mage：attack で40ダメージ返す、mp を10消費
- Healer：attack で10ダメージ返す、mp を5消費

**使用例:**
```ruby
warrior = Warrior.new("太郎", 100, 20)
mage = Mage.new("花子", 80, 50)
healer = Healer.new("次郎", 70, 40)

warrior.status
# 名前: 太郎, HP: 100, MP: 20

puts "Warrior の攻撃: #{warrior.attack} ダメージ"
puts "Mage の攻撃: #{mage.attack} ダメージ"

mage.status  # MP が10減る
```

`solutions/exercise4.rb`に実装してください。

---

## 演習5: ミックスインを使った機能追加

以下のモジュールを作成し、クラスに混ぜ込んでください。

**モジュール要件:**
- `Publishable`：公開・非公開を管理
  - `publish`：公開状態にする
  - `unpublish`：非公開にする
  - `published?`：公開状態かどうか確認

- `Commentable`：コメント機能
  - `add_comment(text)`：コメント追加
  - `comments`：すべてのコメントを返す
  - `comment_count`：コメント数を返す

**Post クラス:**
- 初期化：`title`（タイトル）、`content`（本文）
- Publishable と Commentable をinclude

**使用例:**
```ruby
post = Post.new("Ruby入門", "Rubyについて")

post.add_comment("良い記事ですね")
post.add_comment("参考になりました")

puts post.published?  # => false
post.publish

puts post.published?  # => true
puts post.comment_count  # => 2

post.comments.each { |c| puts "コメント: #{c}" }
```

`solutions/exercise5.rb`に実装してください。

---

## 演習6: 統合演習 - Twitterライクなシステム

以下の要件で、Twitterライクなシステムを実装してください。

**Tweet クラス:**
- 初期化：`author`（作者）、`content`（内容）
- attr_accessor: content
- attr_reader: author, created_at, likes
- `like`メソッド：いいね数を増やす
- `liked_by?(user_name)`：特定のユーザーにいいねされているか確認

**User クラス:**
- 初期化：`name`（名前）、`bio`（自己紹介）
- `post_tweet(content)`：つぶやきを投稿
- `tweets`：投稿したつぶやきを返す
- `like_tweet(tweet)`：つぶやきにいいねする

**要件:**
- Tweetクラスにはモジュールを使ってHashtagableを追加
  - `add_hashtag(tag)`：ハッシュタグを追加
  - `hashtags`：ハッシュタグ一覧を返す

**使用例:**
```ruby
user1 = User.new("太郎", "Ruby好き")
user2 = User.new("花子", "Rails開発者")

tweet = user1.post_tweet("Rubyは素晴らしい言語です")
tweet.add_hashtag("ruby")
tweet.add_hashtag("programming")

user2.like_tweet(tweet)

puts "ツイート: #{tweet.content}"
puts "いいね数: #{tweet.likes}"
puts "ハッシュタグ: #{tweet.hashtags.join(", ")}"
puts "花子にいいねされている? #{tweet.liked_by?("花子")}"
```

`solutions/exercise6.rb`に実装してください。

---

## チェックリスト

すべての演習を完了したら、以下を確認してください：

- [ ] 演習1: Bookクラスが動作する
- [ ] 演習2: Bankクラスが動作する
- [ ] 演習3: 会社管理システムが動作する
- [ ] 演習4: キャラクター継承システムが動作する
- [ ] 演習5: ミックスイン機能が動作する
- [ ] 演習6: Twitterライクなシステムが動作する

## 実行方法

```bash
# サンプルコードの実行
ruby examples/01_classes.rb
ruby examples/02_accessors.rb
ruby examples/03_class_variables.rb
ruby examples/04_inheritance.rb
ruby examples/05_modules_mixins.rb

# 演習の実行
ruby solutions/exercise1.rb
ruby solutions/exercise2.rb
ruby solutions/exercise3.rb
ruby solutions/exercise4.rb
ruby solutions/exercise5.rb
ruby solutions/exercise6.rb
```

## 完了後

すべての演習を完了し、理解できたら Day 4 に進みましょう！
