# Day 1: 演習課題

## 演習1: 環境確認スクリプトの実行

環境構築が完了したら、以下のコマンドを実行してください。

```bash
ruby check_environment.rb
```

すべてのチェックに合格することを確認してください。

**期待される出力:**
```
============================================================
Rails開発環境チェック
============================================================

Ruby バージョン確認... ✓ OK
  ruby 3.3.0 ...
gem コマンド確認... ✓ OK
  gem 3.5.x
Bundler 確認... ✓ OK
  Bundler version 2.5.x
Rails 確認... ✓ OK
  Rails 8.0.x
Git 確認... ✓ OK
  git version 2.x.x
PostgreSQL 確認... ✓ OK
  psql (PostgreSQL) 16.x

============================================================
チェック結果
============================================================
✓ すべてのチェックに合格しました！
  Rails開発を始める準備ができています。
```

## 演習2: Rubyバージョンの切り替え

rbenvを使用してRubyバージョンを切り替える練習をします。

```bash
# 利用可能なバージョンを確認
rbenv versions

# 現在のバージョンを確認
rbenv version

# （オプション）別のバージョンをインストールして切り替え
rbenv install 3.2.0
rbenv local 3.2.0
ruby -v

# 元に戻す
rbenv local 3.3.0
ruby -v
```

**確認事項:**
- [ ] `rbenv versions` で複数のバージョンが表示される
- [ ] `rbenv local` でバージョンを切り替えられる
- [ ] `.ruby-version` ファイルが作成される

## 演習3: 簡単なRubyスクリプトの作成と実行

環境が正しく動作するか確認するため、簡単なRubyスクリプトを作成します。

`hello.rb` を作成してください：

```ruby
#!/usr/bin/env ruby

puts "Hello, Rails!"
# RUBY_VERSION は Ruby の組み込み定数（大文字で始まる）で、宣言なしで使用可能
puts "Ruby version: #{RUBY_VERSION}"
# Time は Ruby の組み込みクラス、now はそのクラスメソッドで、宣言なしで使用可能
puts "Today is: #{Time.now.strftime('%Y-%m-%d')}"
```

**補足説明:**
- `RUBY_VERSION`: Rubyの組み込み定数です。大文字で始まる名前は定数を表し、Rubyが自動的に定義しています。変数宣言は不要です。
- `Time.now`: `Time`はRubyの組み込みクラス、`now`はそのクラスメソッドです。`require`や宣言なしで使用できます。
- これらは「代入」ではなく、組み込みの定数やメソッドを「参照」しているだけです。

実行：

```bash
ruby hello.rb
```

**期待される出力:**
```
Hello, Rails!
Ruby version: 3.3.0
Today is: 2026-01-17
```

## 演習4: Gitの初期設定

Gitの設定を確認・設定します。

```bash
# 現在の設定を確認
git config --list

# ユーザー名とメールアドレスを設定（まだの場合）
git config --global user.name "あなたの名前"
git config --global user.email "your.email@example.com"

# デフォルトブランチ名をmainに設定
git config --global init.defaultBranch main

# エディタを設定（VS Codeの場合）
git config --global core.editor "code --wait"

# 確認
git config user.name
git config user.email
```

**確認事項:**
- [ ] `user.name` が設定されている
- [ ] `user.email` が設定されている
- [ ] `init.defaultBranch` が main になっている

## 演習5: テストRailsプロジェクトの作成

環境確認のため、テスト用のRailsプロジェクトを作成します。

```bash
# ホームディレクトリまたは適当な場所に移動
cd ~

# テストプロジェクトを作成
rails new test_app --skip-bundle

# プロジェクトに移動
cd test_app

# 依存関係をインストール
bundle install

# Railsサーバーを起動
bin/rails server
```

ブラウザで `http://localhost:3000` にアクセスし、Railsのウェルカムページが表示されることを確認してください。

**確認事項:**
- [ ] `rails new` コマンドが正常に完了する
- [ ] `bundle install` が正常に完了する
- [ ] Railsサーバーが起動する
- [ ] ブラウザでウェルカムページが表示される

確認後、サーバーを停止（Ctrl+C）してテストプロジェクトを削除してOKです：

```bash
cd ~
rm -rf test_app
```

## 演習6: エディタの設定確認

使用するエディタ（VS Code推奨）で以下を確認します。

### VS Codeの場合

1. VS Codeでコマンドパレットを開く（Cmd+Shift+P / Ctrl+Shift+P）
2. "Extensions: Install Extensions" を選択
3. 以下の拡張機能をインストール：

**必須:**
   - **Shopify.ruby-lsp** - 公式Ruby Language Server（コード補完、定義ジャンプ）
   - **bung87.rails** - Rails専用機能（ファイルジャンプ、ルーティング補完）
   - **kaiwood.endwise** - Rubyのend自動補完

**推奨:**
   - **aliariff.vscode-erb-beautify** - ERBフォーマッター
   - **rebornix.ruby** - 構文ハイライト強化

**オプション:**
   - **eamodio.gitlens** - Git履歴表示（便利だが必須ではない）

4. 設定を確認：
   - ファイル → 基本設定 → 設定（Cmd+,）
   - "Format On Save" を有効化
   - "Tab Size" を 2 に設定
   - "Editor: Default Formatter" で Ruby LSP を選択

5. Ruby LSP の設定（推奨）：
   - settings.json を開く（コマンドパレット → "Preferences: Open User Settings (JSON)"）
   - 以下を追加：
   ```json
   {
     "[ruby]": {
       "editor.defaultFormatter": "Shopify.ruby-lsp",
       "editor.formatOnSave": true,
       "editor.tabSize": 2,
       "editor.insertSpaces": true
     },
     "rubyLsp.enableExperimentalFeatures": true
   }
   ```

**確認事項:**
- [ ] Shopify.ruby-lsp がインストールされている
- [ ] bung87.rails がインストールされている
- [ ] kaiwood.endwise がインストールされている
- [ ] Format on Save が有効
- [ ] Tab Size が 2 に設定されている
- [ ] Ruby LSP が正常に動作している（.rbファイルを開いて確認）

## チェックリスト

すべての演習を完了したら、以下をチェックしてください：

- [ ] 環境確認スクリプトがすべて合格
- [ ] rbenvでRubyバージョンを切り替えられる
- [ ] Rubyスクリプトが実行できる
- [ ] Gitの設定が完了している
- [ ] Railsプロジェクトが作成できる
- [ ] エディタの設定が完了している

## 完了後

すべて完了したら、Day 2に進みましょう！

Day 2では、Rubyの重要な概念（ブロック、Proc、Lambda、イテレータ）を復習します。
