# Bundler 使用ガイド

## 演習3: Bundlerの基本操作

### ステップ1: Gemfile を作成

```ruby
# Gemfile
source "https://rubygems.org"

ruby "3.3.0"

# メインのジェム
gem "rails", "~> 8.0"
gem "sinatra", "~> 3.0"
gem "pry-rails"
gem "puma", "~> 6.0"
gem "pg", ">= 1.1", "< 2"

# 開発用ジェム
group :development do
  gem "rspec"
  gem "rubocop"
end

# テスト用ジェム
group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
end

# 本番用ジェム
group :production do
  gem "rails_12factor"
end
```

### ステップ2: bundle install を実行

```bash
# Gemfile のあるディレクトリで実行
bundle install

# 出力例:
# Fetching gem metadata from https://rubygems.org/
# Resolving dependencies...
# Using bundler 2.x.x
# Installing activesupport 8.0.0
# Installing builder 3.2.4
# ...
# Bundle complete! 12 Gemfile dependencies, 50 gems now installed.
# Use `bundle info [gemname]` to see where a gem is installed.
```

### ステップ3: インストール済みジェムを確認

```bash
# インストール済みジェムの一覧
bundle show

# 出力例:
# Gems included by the bundle:
#   actioncable (8.0.0)
#   actionmailer (8.0.0)
#   actionpack (8.0.0)
#   actionview (8.0.0)
#   activejob (8.0.0)
#   activemodel (8.0.0)
#   activerecord (8.0.0)
#   activestorage (8.0.0)
#   activesupport (8.0.0)
#   builder (3.2.4)
#   ...

# 特定のジェムの情報
bundle show rails
# /path/to/gems/rails-8.0.0
```

### ステップ4: Gemfile.lock を確認

```bash
ls -la Gemfile.lock
# -rw-r--r--  1 user  group  3456 Jan 15 10:30 Gemfile.lock

# 内容を確認
cat Gemfile.lock
# GEM
#   remote: https://rubygems.org/
#   specs:
#     actioncable (8.0.0)
#       ...
#     actionmailer (8.0.0)
#       ...
#     rails (8.0.0)
#       ...
#
# PLATFORMS
#   ruby
#
# DEPENDENCIES
#   rails (~> 8.0)
#   sinatra (~> 3.0)
#   pry-rails
#   puma (~> 6.0)
#   pg (>= 1.1, < 2)
#
# BUNDLED WITH
#    2.x.x
```

## よく使うコマンド

### インストール関連

```bash
# 通常のインストール
bundle install

# 短縮形
bundle i

# ローカルキャッシュから
bundle install --local

# グループを除外
bundle install --without test
bundle install --without development test

# 本番環境用（最小限）
bundle install --production
bundle install --without development test
```

### 更新関連

```bash
# すべてのジェムを最新版に
bundle update

# 特定のジェムのみ更新
bundle update rails
bundle update rails puma

# dry-run（実際には更新しない）
bundle update --dry-run

# 自動修正
bundle update --bundler
```

### 確認関連

```bash
# インストール済みジェム一覧
bundle show

# 特定のジェムを確認
bundle show rails
bundle show sinatra

# ジェムの情報
bundle info rails

# outdated なジェムを確認
bundle outdated
```

### 実行関連

```bash
# Bundler環境でコマンド実行
bundle exec ruby script.rb
bundle exec rails server
bundle exec rspec spec/
bundle exec irb  # IRB(対話的シェル)

# 短縮形
bundle e ruby script.rb
```

### 依存関係の確認

```bash
# グラフを出力
bundle viz

# Graphvizがない場合は：
sudo apt-get install graphviz  # Linux
brew install graphviz          # macOS
```

## よくあるシナリオと対応

### シナリオ1: 新しいジェムを追加

```ruby
# Gemfile に追加
gem "devise"  # ユーザー認証

# 依存関係を解決してインストール
bundle install

# Git に コミット
git add Gemfile Gemfile.lock
git commit -m "Add devise for user authentication"
```

### シナリオ2: ジェムを削除

```ruby
# Gemfile から削除
# gem "devise"  # この行をコメントアウトまたは削除

# インストール
bundle install

# コミット
git add Gemfile Gemfile.lock
git commit -m "Remove devise gem"
```

### シナリオ3: ジェムをアップデート

```bash
# 特定のジェムのみアップデート
bundle update rails

# 確認
bundle show rails

# テスト実行
bundle exec rails test

# コミット
git add Gemfile.lock
git commit -m "Update Rails to latest version"
```

### シナリオ4: キャッシュのクリア

```bash
# キャッシュをクリア
bundle clean

# 強制的にクリア
bundle clean --force

# 再インストール
bundle install
```

## トラブルシューティング

### エラー: Could not find gems matching

```bash
# 原因: Gemfile に記述されたジェムが見つからない

# 解決:
bundle install --no-cache
bundle exec bundle install
```

### エラー: Gem conflicts

```bash
# 原因: バージョン競合

# 解決:
bundle install --no-cache
rm Gemfile.lock
bundle install
```

### エラー: Could not build native extensions

```bash
# 原因: 開発ツールが不足

# macOS
brew install postgresql libpq

# Linux
sudo apt-get install build-essential libpq-dev
```

### ジェムが正しくロードされない

```bash
# 解決:
bundle install
bundle exec ruby script.rb

# または
ruby -rbundler/setup script.rb
```

## ベストプラクティス

### Gemfile 構成例

```ruby
source "https://rubygems.org"

ruby "3.3.0"

# Rails
gem "rails", "~> 8.0.0"

# データベース
gem "pg", ">= 1.1", "< 2"

# サーバー
gem "puma", "~> 6.0"

# 認証
gem "devise"
gem "pundit"

# API
gem "jsonapi-rails"

# キャッシング
gem "redis", "~> 4.0"

# ログ
gem "lograge"

# デバッグ
group :development do
  gem "pry-rails"
  gem "bullet"
  gem "rack-mini-profiler"
  gem "better_errors"
  gem "binding_of_caller"
end

# テスト
group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "capybara"
  gem "webdrivers"
  gem "vcr"
  gem "webmock"
end

# 本番
group :production do
  gem "rack-timeout"
  gem "rails_12factor"
end

# すべての環境
gem "aws-sdk-s3"
gem "sidekiq"
```

### バージョン指定のルール

```ruby
# 完全一致（推奨されない）
gem "rails", "7.0.0"

# 推奨: マイナーバージョンまで
gem "rails", "~> 7.0"      # >= 7.0.0, < 7.1

# 範囲指定
gem "rails", ">= 7.0.0", "< 8.0.0"

# より小さい
gem "rails", "< 8.0.0"

# より大きい
gem "rails", "> 7.0.0"
```

## 参考

- [Bundler Official](https://bundler.io/)
- [Bundler Gemfile Documentation](https://bundler.io/gemfile.html)
