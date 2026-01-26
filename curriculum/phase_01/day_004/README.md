# Day 4: Ruby復習3 - メタプログラミング基礎

## 学習目標

- メタプログラミングとは何かを理解する
- `send`メソッドを使ってメソッドを動的に呼び出す
- `define_method`を使ってメソッドを動的に定義する
- `method_missing`を使ってメソッド呼び出しをインターセプトする
- `attr_accessor`などの仕組みを理解する
- ブロック付きメソッドを作成する
- メタプログラミングをRailsで実際に使われている技術

## なぜこれらが重要か

Railsはメタプログラミングを大活用しています。

**Railsでの使用例:**
```ruby
# attr_accessorはdefine_methodで実装
attr_accessor :name

# method_missingの使用例
User.find_by_name("太郎")
User.find_by_email("taro@example.com")

# sendの使用例
User.send(:define_method, :greet) { puts "Hello" }

# ブロック付きメソッド
User.where(active: true).each { |u| puts u.name }

# スコープ（Lambdaを使ったメタプログラミング）
scope :active, -> { where(active: true) }
```

これらを理解することで、Railsの魔法的な機能の裏側が見えてきます。

## 今日学ぶこと

### 1. sendメソッド

- メソッドを文字列や シンボルで指定して呼び出す
- 動的なメソッド呼び出し

### 2. define_methodメソッド

- 実行時にメソッドを定義する
- メソッド生成の自動化

### 3. method_missingメソッド

- 定義されていないメソッド呼び出しをキャッチする
- 動的なメソッド生成の基盤

### 4. eval の基本と危険性

- 文字列をRubyコードとして実行する
- セキュリティの考慮

### 5. メタプログラミングの実践的な例

- Railsライクなフレームワーク機能の実装

## 学習の流れ

1. サンプルコード（`examples/`）を読んで実行する
2. 解説を読んで理解を深める
3. 演習課題（`exercises/`）に取り組む
4. Claude にレビューを依頼する
5. 解答例（`solutions/`）と比較する

1. サンプルコード（`examples/`）を読んで実行する
2. 解説を読んで理解を深める
3. 演習課題（`exercises.md`）に取り組む
4. 解答例（`solutions/`）と比較する

## ファイル構成

```
day_004/
├── README.md              # このファイル
├── examples/              # サンプルコード
│   └── ...
├── exercises.md           # 演習課題の説明
├── exercises/             # 演習課題（あなたが実装する）
│   ├── README.md
│   ├── exercise1.rb
│   └── ...
└── solutions/             # 解答例（詰まったら参照）
    ├── exercise1.rb
    └── ...
```


## 注意

メタプログラミングは強力ですが、以下に注意してください：

- **可読性：**メタプログラミングは理解しづらくなりやすい
- **デバッグ：**バグが起こった際に原因が特定しづらい
- **セキュリティ：**`eval`は危険（ユーザー入力で実行しない）
- **必要な時だけ：**可能な限り通常の書き方を使う

## 所要時間

- サンプルコード実行・理解: 60分
- 演習課題: 45-60分
- **合計: 約2時間**

## 参考リンク

- [Ruby Object#send](https://docs.ruby-lang.org/ja/latest/method/Object/i/send.html)
- [Ruby Module#define_method](https://docs.ruby-lang.org/ja/latest/method/Module/i/define_method.html)
- [Ruby Kernel#method_missing](https://docs.ruby-lang.org/ja/latest/method/BasicObject/i/method_missing.html)

## 次のステップ

Day 5では、開発ツール（Git、Bundler、デバッグツール）について学びます。
