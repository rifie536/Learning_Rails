# Git 演習ガイド

このガイドでは、演習1、演習2、演習6のGit演習を実施します。

## 演習1: Gitの基本操作

### 手順

1. **新しいディレクトリを作成**
   ```bash
   mkdir ~/git_practice
   cd ~/git_practice
   ```

2. **Gitリポジトリを初期化**
   ```bash
   git init
   ```

3. **ファイルを作成**
   ```bash
   echo "puts 'Hello, Git!'" > hello.rb
   ```

4. **ファイルをステージングしてコミット**
   ```bash
   git add hello.rb
   git commit -m "Initial commit: Add hello.rb"
   ```

5. **コミット履歴を確認**
   ```bash
   git log --oneline
   ```

6. **ファイルを編集して追加のコミットを作成**
   ```bash
   echo "puts 'Hello, World!'" > hello.rb
   git add hello.rb
   git commit -m "Update hello.rb message"
   ```

7. **履歴を確認**
   ```bash
   git log --oneline
   ```

### TODO: 以下を実施してください

- [ ] 上記のコマンドを実行
- [ ] `git log --oneline` の出力を `git_basic_log.txt` に保存
- [ ] Claude にレビューを依頼

---

## 演習2: ブランチとマージ

### 手順

1. **feature ブランチを作成**
   ```bash
   git checkout -b feature/greet
   ```

2. **新しいファイルを作成**
   ```bash
   cat > greet.rb << 'EOF'
   def greet(name)
     "Hello, #{name}!"
   end

   puts greet("Ruby")
   EOF
   ```

3. **コミット**
   ```bash
   git add greet.rb
   git commit -m "Add greet method"
   ```

4. **main に切り替えてマージ**
   ```bash
   git checkout main
   git merge feature/greet
   ```

5. **bugfix ブランチを作成**
   ```bash
   git checkout -b bugfix/typo
   ```

6. **typoを修正**
   ```bash
   echo "puts 'こんにちは、世界！'" > hello.rb
   git add hello.rb
   git commit -m "Fix typo in hello.rb"
   ```

7. **main にマージ**
   ```bash
   git checkout main
   git merge bugfix/typo
   ```

8. **ブランチを削除**
   ```bash
   git branch -d feature/greet
   git branch -d bugfix/typo
   ```

### TODO: 以下を実施してください

- [ ] 上記のコマンドを実行
- [ ] 実行したコマンドと結果を `branch_workflow.md` に記録
- [ ] Claude にレビューを依頼

---

## 演習6: 実践的なGitワークフロー

### 手順

1. **develop ブランチを作成**
   ```bash
   git checkout -b develop
   ```

2. **feature ブランチを作成**
   ```bash
   git checkout -b feature/user-auth
   echo "# User authentication feature" > auth.rb
   git add auth.rb
   git commit -m "Add user authentication feature"
   ```

3. **develop にマージ**
   ```bash
   git checkout develop
   git merge feature/user-auth
   ```

4. **bugfix ブランチを作成**
   ```bash
   git checkout -b bugfix/login-error
   echo "# Fix login error" >> auth.rb
   git add auth.rb
   git commit -m "Fix login error"
   ```

5. **develop にマージ**
   ```bash
   git checkout develop
   git merge bugfix/login-error
   ```

6. **main にマージ**
   ```bash
   git checkout main
   git merge develop
   ```

7. **バージョンタグを付与**
   ```bash
   git tag -a v1.0.0 -m "Release version 1.0.0"
   git tag
   ```

### TODO: 以下を実施してください

- [ ] 上記のコマンドを実行
- [ ] 実行したコマンドと成果物を `git_workflow_report.md` に記録
- [ ] Claude にレビューを依頼

---

## レビューの依頼方法

演習を完了したら、以下のように Claude に依頼してください：

```
Git 演習1を完了しました。git_basic_log.txt をレビューしてください。
```

```
Git ワークフローを完了しました。git_workflow_report.md をレビューしてください。
```
