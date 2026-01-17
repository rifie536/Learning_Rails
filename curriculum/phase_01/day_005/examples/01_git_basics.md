# Git基本操作ガイド

## Gitとは

Gitは分散バージョン管理システムです。コードの変更履歴を管理し、複数の開発者での協力を可能にします。

## インストール確認

```bash
git --version
# git version 2.x.x
```

## 初期設定

```bash
# ユーザー名とメールアドレスを設定
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# 確認
git config --list
```

## 基本的なワークフロー

### 1. リポジトリの初期化

```bash
# 新しいプロジェクトディレクトリに移動
mkdir my_project
cd my_project

# Gitリポジトリを初期化
git init
# Initialized empty Git repository in /path/to/my_project/.git/
```

`.git`ディレクトリが作成され、このディレクトリ内に履歴情報が保存されます。

### 2. ファイルの追加と確認

```bash
# ファイルを作成
echo "Hello, Git" > hello.txt

# 現在の状態を確認
git status
# On branch master
# No commits yet
# Untracked files:
#   hello.txt
```

### 3. ステージング（追加）

```bash
# ファイルをステージングエリアに追加
git add hello.txt

# 状態確認
git status
# Changes to be committed:
#   new file:   hello.txt

# すべてのファイルを追加する場合
git add .
git add -A
```

### 4. コミット

```bash
# コミットメッセージ付きでコミット
git commit -m "Add hello.txt"
# [master (root-commit) abc1234] Add hello.txt
#  1 file changed, 1 insertion(+)

# または、エディタを開く
git commit
```

### 5. コミット履歴の確認

```bash
# コミット履歴を表示
git log
# commit abc1234567890abcdef1234567890abcdef12345
# Author: Your Name <your.email@example.com>
# Date:   Wed Jan 15 10:30:00 2025 +0900
#     Add hello.txt

# 簡潔な表示
git log --oneline
# abc1234 Add hello.txt

# グラフ表示
git log --graph --oneline --all
```

## よく使うコマンド

### ステータス確認

```bash
git status
# 現在のブランチ、ステージされたファイル、変更ファイルを表示
```

### 変更を確認

```bash
# ワーキングディレクトリ vs ステージングエリア
git diff

# ステージングエリア vs 最後のコミット
git diff --staged
git diff --cached
```

### ファイルの変更を取り消す

```bash
# ワーキングディレクトリの変更を取り消す
git checkout hello.txt

# ステージングエリアから削除
git reset hello.txt

# 最後のコミットをなかったことにする（変更は保持）
git reset --soft HEAD~1

# 最後のコミットをなかったことにする（変更も削除）
git reset --hard HEAD~1
```

### ファイルの削除

```bash
# ファイルを削除してコミット
rm hello.txt
git add hello.txt
git commit -m "Remove hello.txt"

# または
git rm hello.txt
git commit -m "Remove hello.txt"
```

### コミットメッセージの修正

```bash
# 最後のコミットメッセージを修正
git commit --amend -m "Fixed message"

# メッセージだけ修正
git commit --amend --no-edit
```

## リモートリポジトリ

### リモートを追加

```bash
# GitHub, GitLabなどで作成したリモートリポジトリを追加
git remote add origin https://github.com/username/my_project.git

# 確認
git remote -v
```

### プッシュ（アップロード）

```bash
# ローカルのコミットをリモートに送信
git push origin master

# 初回は-uオプションでトラッキングを設定
git push -u origin master

# 以降は git push だけでOK
git push
```

### プル（ダウンロード）

```bash
# リモートの変更をローカルに取得
git pull origin master

# または
git pull
```

### フェッチ（確認）

```bash
# リモートの変更を取得するが、マージしない
git fetch origin

# 内容を確認してからマージ
git merge origin/master
```

## ワークフロー例

### 簡単なワークフロー

```bash
# 1. ファイルを編集
echo "Updated content" >> hello.txt

# 2. 変更を確認
git diff

# 3. ステージング
git add hello.txt

# 4. コミット
git commit -m "Update hello.txt"

# 5. リモートに送信
git push
```

### 複数ファイルの操作

```bash
# ファイルを複数作成
touch file1.txt file2.txt file3.txt

# すべてを追加
git add .

# 確認
git status

# コミット
git commit -m "Add multiple files"

# プッシュ
git push
```

## よくあるエラーと対処

### error: pathspec 'filename' did not match any files

```bash
# ファイルが存在しない
git status  # で確認

# typoをチェック
git add correct_filename.txt
```

### fatal: not a git repository

```bash
# Gitリポジトリではないディレクトリにいる
git init  # で初期化

# または
cd correct_directory  # 正しいディレクトリに移動
```

### nothing to commit

```bash
# 変更がない状態でcommitしようとしている
git status  # で確認
git add file.txt  # 必要なファイルを追加
```

## 次のステップ

- ブランチ操作を学ぶ（`02_git_workflow.md`）
- GitHub連携を学ぶ
- コンフリクト解決を学ぶ
