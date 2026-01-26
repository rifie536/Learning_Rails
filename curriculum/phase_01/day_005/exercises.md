# Day 5: 演習課題

## 演習1: Gitの基本操作

以下の手順を実行してください。

**要件:**
1. 新しいディレクトリ `git_practice` を作成
2. Gitリポジトリを初期化
3. `hello.rb` というファイルを作成（内容は自由）
4. ファイルをステージングしてコミット
5. コミット履歴を確認
6. ファイルを編集して追加のコミットを作成
7. `git log --oneline` で履歴を確認

**コマンド例:**
```bash
mkdir git_practice
cd git_practice
git init
echo "puts 'Hello'" > hello.rb
git add hello.rb
git commit -m "Initial commit"
git log --oneline
```

**提出物:**
- `solutions/git_basic_log.txt` に最終的な `git log --oneline` の出力を保存

---

## 演習2: ブランチとマージ

以下のシナリオで実行してください。

**要件:**
1. `master` ブランチから `feature/greet` ブランチを作成
2. `feature/greet` で `greet.rb` を作成（メソッドを実装）
3. コミット
4. `master` に切り替えて `feature/greet` をマージ
5. 別の `bugfix/typo` ブランチを作成
6. typoを修正してコミット
7. `master` にマージ
8. ブランチを削除

**提出物:**
- `solutions/branch_workflow.md` に実行したコマンドと結果を記述

---

## 演習3: Bundlerの基本操作

Ruby on Rails を新しく作成してみます。

**要件:**
1. `Gemfile` を手動で作成
2. `rails`, `sinatra`, `pry-rails` などのジェムを指定
3. `bundle install` を実行
4. インストールされたジェムを確認
5. `Gemfile.lock` ファイルの内容を確認

**使用例:**
```ruby
# Gemfile
source "https://rubygems.org"

ruby "3.3.0"

gem "rails", "~> 8.0"
gem "puma"
gem "pry-rails"

group :development do
  gem "rspec"
end
```

**提出物:**
- `solutions/Gemfile` - 作成した Gemfile
- `solutions/bundler_output.txt` - `bundle install` の出力

---

## 演習4: デバッグスキル - バグを見つけて修正

以下のバギーなコードを修正してください。

**バグのあるコード:**
```ruby
# solutions/debug_exercise.rb

class Calculator
  def initialize(value)
    @value = value
  end

  def add(n)
    @value + n
  end

  def multiply(n)
    @value * n
  end

  def divide(n)
    @value / n  # バグ：n が 0 の場合クラッシュ
  end

  def result
    @value
  end

  def reset
    @value = 0
  end
end

# テスト
calc = Calculator.new(10)
puts calc.add(5)       # => 15
puts calc.multiply(2)  # => 30
puts calc.divide(5)    # => 6
puts calc.divide(0)    # => ZeroDivisionError!
```

**要件:**
1. デバッグコードを追加して問題を特定
2. バグを修正する
3. `puts`, `p`, `pp` を使ってデバッグ出力を追加
4. 修正版を `solutions/debug_solution.rb` に保存

---

## 演習5: 複合デバッグ - ユーザーマネージャーのバグ修正

以下のコードにバグがあります。デバッグして修正してください。

**バグのあるコード:**
```ruby
# solutions/complex_debug.rb

class User
  attr_accessor :id, :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end
end

class UserManager
  def initialize
    @users = []
  end

  def add_user(id, name, email)
    @users << User.new(id, name, email)
  end

  def find_by_id(id)
    @users.find { |u| u.id == id }
  end

  def find_by_email(email)
    @users.find { |u| u.email == email }
  end

  def all_users
    @users
  end

  def remove_user(id)
    @users.delete_if { |u| u.id == id }
  end
end

# テスト（バグが含まれている）
manager = UserManager.new
manager.add_user(1, "太郎", "taro@example.com")
manager.add_user(2, "花子", "hanako@example.com")
manager.add_user(3, "次郎", "jiro@example.com")

# ここでバグが発生
user = manager.find_by_email("taro@example.com")
puts user.name  # => 期待値: "太郎"

# 削除後に検索
manager.remove_user(2)
removed = manager.find_by_email("hanako@example.com")
puts removed.nil?  # => 期待値: true

# ユーザー数
puts manager.all_users.length  # => 期待値: 2
```

**要件:**
1. デバッグコードを追加
2. 各メソッドの動作を確認
3. 問題を特定して修正
4. テストを追加

---

## 演習6: 実践的なGitワークフロー

複数のブランチでの開発をシミュレートしてください。

**シナリオ:**
1. `master` から `develop` ブランチを作成
2. `develop` から `feature/user-auth` を作成してユーザー認証機能を実装
3. `develop` から `bugfix/login-error` を作成してバグを修正
4. 両方を `develop` にマージ
5. テストして問題がなければ `develop` を `master` にマージ
6. バージョンタグ `v1.0.0` を付与

**提出物:**
- `solutions/git_workflow_report.md` - 実行したコマンドと成果物

---

## チェックリスト

すべての演習を完了したら、以下を確認してください：

- [ ] 演習1: Git の基本操作ができる
- [ ] 演習2: ブランチとマージができる
- [ ] 演習3: Bundler で依存管理ができる
- [ ] 演習4: デバッグツールを使ってバグを修正できる
- [ ] 演習5: 複合的なコードをデバッグできる
- [ ] 演習6: 実践的なGitワークフローが理解できる

## 実行方法

### 演習1-2（Git）

```bash
# ディレクトリを作成して演習
mkdir -p ~/git_practice
cd ~/git_practice

# コマンドを実行
git init
git add .
git commit -m "Initial commit"

# 解答例の確認（詰まったら参照）
ruby solutions/exercise1.rb
ruby solutions/exercise2.rb
# ...
```

### 演習3（Bundler）

```bash
# Gemfile を作成して実行
mkdir -p ~/bundler_practice
cd ~/bundler_practice

# Gemfile を作成（テキストエディタで編集）
bundle install
```

### 演習4-5（デバッグ）

```bash
# Rubyファイルを実行してテスト
ruby solutions/debug_solution.rb
ruby solutions/complex_debug.rb
```

## 完了後

これで Phase 1 の学習が完了です！

次のステップ：
- Phase 2: Rails の基本
- 実際のプロジェクトでこれらのスキルを応用
- チーム開発でのベストプラクティスを学ぶ
