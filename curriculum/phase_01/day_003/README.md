# Day 3: Ruby復習2 - クラス、モジュール、ミックスイン

## 学習目標

- クラスの構造と特徴を理解する
- インスタンス変数とクラス変数の違いを理解する
- アクセサメソッド（attr_accessor, attr_reader, attr_writer）を使いこなす
- 継承の仕組みを理解する
- モジュールとは何かを理解する
- ミックスインを使ってコードを再利用する
- includeとextendの違いを理解する

## なぜこれらが重要か

Railsのコードはクラスとモジュールでできています。

**Railsでの使用例:**
```ruby
# クラスの継承
class User < ApplicationRecord
  # includeでミックスイン
  include Timestampable
  include Validatable

  # attr_accessorの使用
  attr_accessor :name, :email

  # クラス変数
  @@count = 0
end

# モジュール（ミックスイン）
module Timestampable
  def created_at
    @created_at
  end
end

# 別のミックスイン方法
module Loggable
  def log(message)
    puts "[#{Time.now}] #{message}"
  end
end
```

これらを理解していないと、Railsの基本的なクラス構造が読めません。

## 今日学ぶこと

### 1. クラスの基本

- クラスの定義
- インスタンスの作成
- initializeメソッド
- インスタンス変数

### 2. アクセサメソッド

- attr_reader（読み込み専用）
- attr_writer（書き込み専用）
- attr_accessor（読み書き両用）

### 3. クラス変数とクラスメソッド

- @@クラス変数
- self.メソッド
- クラスメソッドの使用場面

### 4. 継承

- 継承の仕組み
- superキーワード
- メソッドのオーバーライド

### 5. モジュール

- モジュールの定義
- includeとextendの違い
- ミックスインのパターン

## 学習の流れ

1. サンプルコード（`examples/`）を読んで実行する
2. 解説を読んで理解を深める
3. 演習課題（`exercises/`）に取り組む
4. Claude にレビューを依頼する
5. 解答例（`solutions/`）と比較する

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
day_003/
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


## 所要時間

- サンプルコード実行・理解: 60分
- 演習課題: 45-60分
- **合計: 約2時間**

## 参考リンク

- [Rubyクラス](https://docs.ruby-lang.org/ja/latest/class/Class.html)
- [Rubyモジュール](https://docs.ruby-lang.org/ja/latest/class/Module.html)
- [Rubyガイド - クラスとモジュール](https://guides.rubyonrails.org/)

## 次のステップ

Day 4では、メタプログラミング基礎について学びます。
