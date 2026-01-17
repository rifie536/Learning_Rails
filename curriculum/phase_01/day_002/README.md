# Day 2: Ruby復習1 - ブロック、Proc、Lambda、イテレータ

## 学習目標

- ブロックの概念と使い方を理解する
- Procとは何かを理解する
- Lambdaとは何かを理解する
- ProcとLambdaの違いを説明できる
- イテレータの使い方をマスターする

## なぜこれらが重要か

Railsのコードでは、ブロック、Proc、Lambdaが頻繁に使用されます。

**Railsでの使用例:**
```ruby
# ブロック
User.where(active: true).each do |user|
  puts user.name
end

# Lambda（スコープ）
scope :active, -> { where(active: true) }

# Proc（コールバック）
before_save :normalize_email

# イテレータ
users.map(&:name)
users.select { |u| u.admin? }
```

これらを理解していないと、Railsのコードが読めません。

## 今日学ぶこと

### 1. ブロック

### 2. Proc

### 3. Lambda

### 4. ProcとLambdaの違い

### 5. イテレータ

## 学習の流れ

1. サンプルコード（`examples/`）を読んで実行する
2. 解説を読んで理解を深める
3. 演習課題（`exercises.md`）に取り組む
4. 解答例（`solutions/`）と比較する

## ファイル構成

```
day_002/
├── README.md              # このファイル
├── examples/              # サンプルコード
│   ├── 01_blocks.rb
│   ├── 02_proc.rb
│   ├── 03_lambda.rb
│   ├── 04_proc_vs_lambda.rb
│   └── 05_iterators.rb
├── exercises.md           # 演習課題
└── solutions/             # 解答例
    ├── exercise1.rb
    ├── exercise2.rb
    └── ...
```

## 所要時間

- サンプルコード実行・理解: 60分
- 演習課題: 30-45分
- **合計: 約1.5-2時間**

## 参考リンク

- [Rubyブロックガイド](https://docs.ruby-lang.org/ja/latest/doc/spec=2fcall.html#block)
- [Proc と Lambda](https://docs.ruby-lang.org/ja/latest/class/Proc.html)

## 次のステップ

Day 3では、クラス、モジュール、ミックスインについて復習します。
