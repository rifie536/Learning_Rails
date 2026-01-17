# Gitワークフロー - ブランチとマージ

## ブランチとは

ブランチは独立した開発ラインです。メインのコードに影響を与えずに開発できます。

```
master（メインブランチ）
  ├── feature/user-auth（機能開発用）
  ├── bugfix/login-error（バグ修正用）
  └── develop（開発ブランチ）
```

## ブランチ操作

### ブランチの確認

```bash
# ローカルブランチ一覧
git branch
# * master          （現在のブランチは*付き）
#   develop

# リモートも含めて確認
git branch -a
# * master
#   remotes/origin/master
#   remotes/origin/develop

# 詳細情報
git branch -vv
```

### ブランチの作成

```bash
# 新しいブランチを作成
git branch feature/new-feature

# 作成と同時に切り替え
git checkout -b feature/new-feature

# 最新の方法（Git 2.23+）
git switch -c feature/new-feature
```

### ブランチの切り替え

```bash
# ブランチを切り替え
git checkout master

# または
git switch master

# 前のブランチに戻る
git checkout -
```

### ブランチの削除

```bash
# ローカルブランチを削除
git branch -d feature/new-feature

# 削除を強制（マージされていなくても）
git branch -D feature/new-feature

# リモートブランチを削除
git push origin --delete feature/new-feature
```

### ブランチの名前変更

```bash
# 現在のブランチを名前変更
git branch -m new-name

# 特定のブランチを名前変更
git branch -m old-name new-name
```

## マージ

### 基本的なマージ

```bash
# feature ブランチで開発
git checkout -b feature/login
# ファイルを編集
echo "Login functionality" > login.txt
git add .
git commit -m "Add login feature"

# master に戻る
git checkout master

# feature/login をマージ
git merge feature/login
# Merge made by the 'recursive' strategy.
#  login.txt | 1 +
#  1 file changed, 1 insertion(+)

# ブランチを削除
git branch -d feature/login
```

### 典的なワークフロー

```bash
# 1. develop ブランチを作成（初回のみ）
git checkout -b develop

# 2. 機能開発用ブランチを作成
git checkout -b feature/user-auth

# 3. 開発（ファイルを編集）
echo "Authentication code" > auth.rb
git add .
git commit -m "feat: Add user authentication"

# 4. 複数回のコミット
echo "More code" >> auth.rb
git add .
git commit -m "feat: Add password validation"

# 5. develop に戻す
git checkout develop

# 6. feature をマージ
git merge feature/user-auth
# Merge made by the 'recursive' strategy.

# 7. master にマージ
git checkout master
git merge develop

# 8. ブランチをプッシュ
git push origin master
git push origin develop
```

## コンフリクト（競合）の解決

### コンフリクトが起きる状況

```bash
# ブランチAとBが同じファイルの同じ行を編集
# マージするとコンフリクトが発生
```

### コンフリクトの確認

```bash
git merge feature/branch
# Auto-merging file.txt
# CONFLICT (content): Merge conflict in file.txt
# Automatic merge failed; fix conflicts and then commit the result.

git status
# Unmerged paths:
#   both modified:   file.txt
```

### ファイルの確認

```bash
# コンフリクト部分
cat file.txt
# <<<<<<< HEAD
# Content from master
# =======
# Content from feature/branch
# >>>>>>> feature/branch
```

### コンフリクトの解決

```bash
# エディタで手動修正
# <<<< >>>> を削除して正しい内容に変更

# 修正後
git add file.txt
git commit -m "Resolve merge conflict"
```

## リベース

### リベースとは

マージの代わりにリベースを使う方法（履歴をきれいにする）

```bash
# feature ブランチにいる状態で
git rebase master

# コンフリクトがあれば解決
git rebase --continue

# またはキャンセル
git rebase --abort
```

### マージ vs リベース

**マージ:**
```
master ----●-----●----●
           |           |
feature    └─●──●─────┘
```

**リベース:**
```
master ----●-----●----●
           |     |     |
feature    └─●──●────
```

## ワークフロー例（Git Flow）

### Feature ブランチワークフロー

```bash
# 1. develop で最新コード更新
git checkout develop
git pull origin develop

# 2. Feature ブランチ作成
git checkout -b feature/user-profile

# 3. 開発
echo "User profile code" > profile.rb
git add .
git commit -m "feat: Add user profile page"

# 4. プッシュ
git push -u origin feature/user-profile

# 5. プルリクエスト (GitHub, GitLab) をレビュー

# 6. マージ
git checkout develop
git merge feature/user-profile
git push origin develop

# 7. ブランチ削除
git branch -d feature/user-profile
git push origin --delete feature/user-profile
```

## ローカル vs リモート

### ローカルのみ

```bash
git branch feature/local-only
git checkout feature/local-only
# リモートにプッシュしない
```

### リモートに送信

```bash
git push -u origin feature/local-only
# 以降はリモートでも可視
```

### リモートから取得

```bash
git fetch origin
git checkout --track origin/feature/remote-branch
```

## ベストプラクティス

### ブランチ命名規則

```bash
# 機能開発
git checkout -b feature/user-authentication

# バグ修正
git checkout -b bugfix/login-error

# ホットフィックス
git checkout -b hotfix/critical-bug

# リリース準備
git checkout -b release/v1.0.0
```

### コミットメッセージ

```bash
# 型を含める
git commit -m "feat: Add new feature"      # 新機能
git commit -m "fix: Fix bug"               # バグ修正
git commit -m "docs: Update README"        # ドキュメント
git commit -m "refactor: Refactor code"    # リファクタリング
git commit -m "style: Fix formatting"      # スタイル
git commit -m "test: Add tests"            # テスト
```

## よく使うコマンド

```bash
# 現在のブランチを確認
git status

# 全ブランチを表示
git branch -a

# 変更を確認してからマージ
git log --oneline master..feature/branch

# ブランチ間の差分
git diff master feature/branch

# マージした/されたブランチを確認
git branch --merged
git branch --no-merged
```

## 次のステップ

- ローカルとリモートの同期を完璧にする
- プルリクエスト（PR）の流れを学ぶ
- GitHub/GitLabの連携を学ぶ
