# 詳細セットアップガイド

## macOSの場合

### 1. Homebrewのインストール

```bash
# Homebrewがインストール済みか確認
which brew

# インストールされていない場合
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. rbenvのインストール

```bash
# rbenvとruby-buildをインストール
brew install rbenv ruby-build

# rbenvの初期化設定を追加
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

# 設定を再読み込み
source ~/.zshrc

# 確認
rbenv --version
```

### 3. Rubyのインストール

```bash
# インストール可能なRubyバージョンを確認
rbenv install -l

# Ruby 3.3.x（最新の安定版）をインストール
rbenv install 3.3.0

# グローバルで使用するバージョンを設定
rbenv global 3.3.0

# 確認
ruby -v
# => ruby 3.3.0 ...と表示されればOK
```

### 4. Bundlerのインストール

```bash
gem install bundler
rbenv rehash
bundler -v
```

### 5. Railsのインストール

```bash
gem install rails
rbenv rehash
rails -v
# => Rails 8.0.x ...と表示されればOK
```

### 6. PostgreSQLのインストール（後で使用）

```bash
brew install postgresql@16
brew services start postgresql@16

# パスを通す
echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# 確認
psql --version
```

### 7. Gitの確認

```bash
# Gitがインストール済みか確認
git --version

# インストールされていない場合
brew install git

# Git設定
git config --global user.name "あなたの名前"
git config --global user.email "your.email@example.com"
```

## Windowsの場合（WSL2推奨）

### 1. WSL2のインストール

```powershell
# PowerShellを管理者権限で実行
wsl --install
```

再起動後、Ubuntu等のLinuxディストリビューションをセットアップします。

### 2. WSL2内でのセットアップ

WSL2のUbuntu内で以下を実行：

```bash
# システムアップデート
sudo apt update
sudo apt upgrade -y

# 必要なパッケージ
sudo apt install -y git curl libssl-dev libreadline-dev zlib1g-dev \
  autoconf bison build-essential libyaml-dev libreadline-dev \
  libncurses5-dev libffi-dev libgdbm-dev

# rbenvのインストール
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# ruby-buildのインストール
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Rubyのインストール
rbenv install 3.3.0
rbenv global 3.3.0

# Bundler、Railsのインストール
gem install bundler rails
rbenv rehash

# PostgreSQL
sudo apt install -y postgresql postgresql-contrib libpq-dev
sudo service postgresql start
```

## エディタ設定

### VS Code（推奨）

```bash
# VS Codeをインストール（macOS）
brew install --cask visual-studio-code
```

**推奨拡張機能:**
- Ruby LSP
- ERB Formatter/Beautify
- Rails
- GitLens
- Prettier

VS Codeの設定（`settings.json`）:

```json
{
  "editor.formatOnSave": true,
  "ruby.intellisense": "rubyLocate",
  "ruby.useBundler": true,
  "ruby.lint": {
    "rubocop": true
  },
  "[ruby]": {
    "editor.defaultFormatter": "rubyfmt.rubyfmt",
    "editor.tabSize": 2
  }
}
```

## トラブルシューティング

### rbenv: command not found

```bash
# .zshrc or .bashrcに以下が追加されているか確認
eval "$(rbenv init - zsh)"  # zshの場合
eval "$(rbenv init - bash)" # bashの場合

# 設定を再読み込み
source ~/.zshrc  # or source ~/.bashrc
```

### gem install rails がエラー

```bash
# rbenv rehashを実行
rbenv rehash

# Bundlerが正しくインストールされているか確認
gem list bundler
```

### PostgreSQL接続エラー

```bash
# PostgreSQLが起動しているか確認（macOS）
brew services list

# 起動していない場合
brew services start postgresql@16
```

## 確認チェックリスト

- [ ] `ruby -v` が 3.3.0 を表示
- [ ] `rails -v` が 8.0.x を表示
- [ ] `bundler -v` が表示される
- [ ] `git --version` が表示される
- [ ] `psql --version` が表示される
- [ ] エディタがインストール済み

すべてチェックが付いたら、`check_environment.rb` を実行して確認してください。
