# Bundler ガイド - ジェム依存管理

## Bundlerとは

Bundlerは Ruby のジェム（パッケージ）を管理するツールです。Railsアプリケーションでは必須です。

```bash
# インストール確認
bundler --version
# Bundler version 2.x.x
```

## Gemfile の作成

### 基本的な Gemfile

```ruby
# Gemfile
source "https://rubygems.org"

ruby "3.3.0"

gem "rails", "~> 8.0"
gem "pg", ">= 1.1", "< 2"
gem "puma", "~> 6.0"
gem "sass-rails", "~> 6"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
end

group :development do
  gem "web-console", ">= 4.1.0"
end
```

## バージョン指定

### 演算子

```ruby
# 完全一致
gem "rails", "7.0.0"

# より大きい/小さい
gem "rails", "> 7.0.0"
gem "rails", "< 8.0.0"

# 範囲
gem "rails", ">= 7.0.0", "< 8.0.0"

# 〜（チルダ）: マイナーバージョンまで指定
gem "rails", "~> 7.0"    # >= 7.0.0, < 7.1
gem "rails", "~> 7.0.0"  # >= 7.0.0, < 7.1.0

# キャレット（Gemfileでは使用不可）
# npm などで使用
```

## よく使うコマンド

### bundle install

新しい Gemfile をセットアップするか、依存関係をインストール

```bash
# Gemfile に従ってインストール
bundle install

# または
bundle i

# --local で既存のキャッシュから取得
bundle install --local

# --without でグループを除外
bundle install --without test
```

### bundle update

ジェムを最新バージョンに更新

```bash
# すべてを更新
bundle update

# 特定のジェムを更新
bundle update rails

# dry-run（実際には更新しない）
bundle update --dry-run
```

### bundle exec

Gemfile の環境で Ruby コマンドを実行

```bash
# レールを実行
bundle exec rails server

# テストを実行
bundle exec rspec spec/

# Rubyスクリプトを実行
bundle exec ruby script.rb

# Bundlerで管理されたバージョンで実行
bundle exec gem list
```

### bundle show

インストール済みのジェムを確認

```bash
# すべてのジェムを表示
bundle show

# 特定のジェムのパスを表示
bundle show rails

# インストールされているかを確認
bundle show rails --path
```

### bundle info

ジェムの詳細情報

```bash
# インストール済みジェムの情報
bundle info rails

# バージョンと場所を表示
bundle info puma
```

## Gemfile.lock について

### Gemfile.lock の役割

```
Gemfile.lock は、実際にインストールされたジェムのバージョンを完全に記録します。
すべての開発者、サーバーが同じバージョンを使用することを保証します。
```

### 管理方法

```bash
# Git に含める（ほぼ必須）
git add Gemfile.lock
git commit -m "Update Gemfile.lock"

# .gitignore には含めない
# （含めると環境によってバージョンが異なる問題が発生）
```

### Gemfile vs Gemfile.lock

```
Gemfile:
- 開発者が記述
- おおまかなバージョン指定
- 例: gem "rails", "~> 7.0"

Gemfile.lock:
- bundle install で自動生成
- 正確なバージョン
- 例: rails (7.0.4)
```

## よくあるシナリオ

### 新しいジェムを追加

```ruby
# 1. Gemfile に追加
gem "devise"  # ユーザー認証

# 2. インストール
bundle install

# 3. コミット
git add Gemfile Gemfile.lock
git commit -m "Add devise for authentication"
```

### ジェムを削除

```ruby
# 1. Gemfile から削除
# gem "devise"  # この行を削除

# 2. Gemfile.lock を更新
bundle install

# 3. コミット
git add Gemfile Gemfile.lock
git commit -m "Remove devise gem"
```

### グループ分け

```ruby
# Gemfile
group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem "pry-rails"
  gem "better_errors"
end

group :production do
  gem "rails_12factor"
end

# 本番環境ではインストール対象外
bundle install --without production

# または実行時に指定
export BUNDLE_WITHOUT=production
bundle install
```

### Rails アプリケーションでのセットアップ

```bash
# 1. Gemfile が既存する場合（新規プロジェクトクローン）
cd my_rails_app
bundle install

# 2. rails コマンドを実行
bundle exec rails server
# または短縮形
rails server

# 3. データベース準備
bundle exec rails db:create
bundle exec rails db:migrate

# 4. テスト実行
bundle exec rspec
```

## トラブルシューティング

### Gem conflicts

```bash
# エラー: multiple matching gemspecs

# 原因: 異なるバージョンのジェムが競合

# 解決:
bundle clean --force
bundle install
```

### Could not locate Gemfile

```bash
# Gemfile が見つからない

# 確認
ls -la Gemfile

# ない場合は作成
bundle init

# Railsの場合
rails new my_app
```

### You must use Bundler 2 or greater

```bash
# Bundler のアップデート
gem install bundler

# または
bundle update bundler
```

### Native extensions won't compile

```bash
# 開発ツールが不足している

# macOS
brew install postgresql libpq

# Linux
sudo apt-get install postgresql libpq-dev
```

## ベストプラクティス

### Gemfile 管理

```ruby
source "https://rubygems.org"

ruby "3.3.0"

# Rails とミドルウェア
gem "rails", "~> 8.0.0"
gem "puma", "~> 6.0"
gem "pg", ">= 1.1", "< 2"

# UI/テンプレート
gem "slim-rails"
gem "bootstrap"

# データ検証
gem "validates_presence_of_array"

# 認証・認可
gem "devise"
gem "pundit"

# テスト
group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "capybara"
end

# 開発ツール
group :development do
  gem "pry-rails"
  gem "bullet"
  gem "rack-mini-profiler"
end
```

### バージョンアップの注意

```bash
# マイナーバージョンアップ（安全）
bundle update rails:~> 8.0

# メジャーバージョンアップ（危険、テスト必須）
# Gemfile を編集して実施
# gem "rails", "~> 8.0" -> gem "rails", "~> 9.0"
bundle install
bundle exec rails test
```

## 次のステップ

- プライベート Gem サーバーの構築
- ジェムの作成と公開
- Bundler プラグインの使用
