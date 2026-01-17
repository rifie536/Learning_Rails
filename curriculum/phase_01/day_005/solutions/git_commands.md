# Git 実行コマンド集

## 演習1: Git基本操作

```bash
# ディレクトリ作成
mkdir git_practice
cd git_practice

# Gitリポジトリ初期化
git init
# Initialized empty Git repository in /path/to/git_practice/.git/

# ファイル作成
echo "puts 'Hello from Ruby'" > hello.rb

# 状態確認
git status
# On branch master
# No commits yet
# Untracked files:
#   hello.txt

# ステージング
git add hello.rb

# 状態確認（ステージ済み）
git status
# Changes to be committed:
#   new file:   hello.rb

# コミット
git commit -m "Initial commit: Add hello.rb"
# [master (root-commit) abc1234] Initial commit: Add hello.rb
#  1 file changed, 1 insertion(+)

# 履歴確認
git log
# commit abc1234567890abcdef1234567890abcdef12345
# Author: Your Name <your.email@example.com>
# Date:   Wed Jan 15 10:30:00 2025 +0900
#     Initial commit: Add hello.rb

# コンパクト表示
git log --oneline
# abc1234 Initial commit: Add hello.rb

# ファイル編集
echo "puts 'Hello from Ruby 2'" > hello.rb

# 変更確認
git diff

# ステージして別のコミット作成
git add .
git commit -m "Update hello.rb with new message"

# 最終的な履歴
git log --oneline
# def5678 Update hello.rb with new message
# abc1234 Initial commit: Add hello.rb
```

## 演習2: ブランチとマージ

```bash
# 現在のブランチを確認
git branch
# * master

# feature ブランチを作成
git branch feature/greet

# 切り替え
git checkout feature/greet
# Switched to branch 'feature/greet'

# または作成と切り替えを一度に
git checkout -b feature/greet

# feature ブランチ上で作業
echo "def greet(name)\n  puts \"Hello, #{name}!\"\nend" > greet.rb

# ステージしてコミット
git add greet.rb
git commit -m "feat: Add greet function"

# master に戻る
git checkout master

# feature/greet をマージ
git merge feature/greet
# Merge made by the 'recursive' strategy.
#  greet.rb | 3 ++++
#  1 file changed, 3 insertions(+)

# bugfix ブランチを作成
git checkout -b bugfix/typo

# typoを修正（例：ファイル編集）
echo "def greet(name)\n  puts \"Hello, #{name}!\"\nend" > greet.rb

# コミット
git add .
git commit -m "fix: Fix typo in greet function"

# master に戻る
git checkout master

# マージ
git merge bugfix/typo

# ブランチを削除
git branch -d feature/greet
git branch -d bugfix/typo

# 確認
git branch
# * master

# 履歴確認（グラフ表示）
git log --graph --oneline --all
# *   abc1234 Merge branch 'bugfix/typo'
# |\
# | * def5678 fix: Fix typo in greet function
# *   ghi9012 Merge branch 'feature/greet'
# |\
# | * jkl3456 feat: Add greet function
# |/
# * mno7890 Initial commit
```

## よく使うコマンド

### 状態確認
```bash
git status              # 現在の状態
git log                 # コミット履歴
git log --oneline       # 簡潔な履歴
git log -p              # 差分付き履歴
git diff                # 変更内容
git diff --staged       # ステージ済みの変更
```

### ファイル操作
```bash
git add <file>          # ファイルをステージ
git add .               # すべてをステージ
git rm <file>           # ファイルを削除
git mv <old> <new>      # ファイルをリネーム
git checkout <file>     # 変更を取り消す
git reset <file>        # ステージから除外
```

### ブランチ操作
```bash
git branch              # ブランチ一覧
git branch <name>       # ブランチ作成
git checkout <branch>   # ブランチ切り替え
git checkout -b <name>  # 作成と切り替え
git merge <branch>      # マージ
git branch -d <name>    # ブランチ削除
```

### リモート操作
```bash
git remote -v           # リモート確認
git remote add <name> <url>  # リモート追加
git push origin <branch>     # プッシュ
git pull origin <branch>     # プル
git fetch origin             # フェッチ
```

### コミット操作
```bash
git commit -m "message"      # メッセージ付きコミット
git commit --amend           # 最後のコミットを修正
git revert <commit>          # コミットを打ち消す
git reset --soft HEAD~1      # 最後のコミット前に戻す（変更保持）
git reset --hard HEAD~1      # 最後のコミット前に戻す（変更破棄）
```

### タグ
```bash
git tag v1.0.0               # タグを作成
git tag -l                   # タグ一覧
git tag -d v1.0.0            # タグを削除
git push origin v1.0.0       # タグをプッシュ
```
