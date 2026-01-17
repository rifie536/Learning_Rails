# Day 5: 開発ツール - Git、Bundler、デバッグツール

## 学習目標

- Gitの基本的な操作をマスターする
- Gitのワークフロー（add、commit、push）を理解する
- ブランチ操作とマージを理解する
- Bundlerでジェムの管理ができる
- Gemfile と Gemfile.lock の役割を理解する
- デバッグツール（pry、binding.pry）を使ってコードをデバッグできる
- byebugを使ったステップ実行ができる

## なぜこれらが重要か

Railsでの開発には、これらのツールの理解が必須です。

**実務での使用:**
```bash
# Gitのフロー
git add .
git commit -m "feat: ユーザー認証機能を追加"
git push origin feature/user-auth

# Bundlerで依存管理
bundle install
bundle update

# デバッグ
binding.pry  # コードの実行を中断してREPLに入る
```

これらを習得することで、効率的な開発ができるようになります。

## 今日学ぶこと

### 1. Gitの基本

- `git init`：リポジトリを初期化
- `git add`：ステージングエリアに追加
- `git commit`：コミット
- `git push`/`git pull`：リモートとの同期
- `git status`：ステータス確認
- `git log`：履歴確認

### 2. ブランチ操作

- `git branch`：ブランチ操作
- `git checkout`/`git switch`：ブランチ切り替え
- `git merge`：ブランチをマージ

### 3. Bundler の使用

- Gemfile の書き方
- `bundle install`
- `bundle update`
- `bundle exec`

### 4. デバッグツール

- `pry`の基本的な使い方
- `binding.pry`でコードを停止
- ステップ実行（byebug）

### 5. デバッグコマンド

- `p`/`pp`：値の出力
- `puts`：文字列出力
- `inspect`：オブジェクト情報

## 学習の流れ

1. サンプルコード（`examples/`）を実行して学ぶ
2. 解説を読んで理解を深める
3. 演習課題（`exercises.md`）に取り組む
4. 解答例（`solutions/`）と比較する

## ファイル構成

```
day_005/
├── README.md              # このファイル
├── examples/              # サンプルコード・説明
│   ├── 01_git_basics.md
│   ├── 02_git_workflow.md
│   ├── 03_bundler_guide.md
│   ├── 04_debugging.rb
│   └── 05_practice.rb
├── exercises.md           # 演習課題
└── solutions/             # 解答例・コマンド集
    ├── git_commands.md
    ├── bundler_guide.md
    └── debugging_practice.rb
```

## 環境確認

事前に以下がインストールされていることを確認してください：

```bash
git --version
ruby --version
bundler --version
```

## 注意

Gitは分散バージョン管理システムです。慎重に操作してください。

**危険なコマンド:**
- `git reset --hard` ：変更を完全に削除
- `git push --force` ：リモートの履歴を上書き

## 所要時間

- Gitの基本: 45分
- Bundlerの使用: 30分
- デバッグ: 30分
- **合計: 約1.5-2時間**

## 参考リンク

- [Git Documentation](https://git-scm.com/doc)
- [Bundler Guide](https://bundler.io/)
- [pry Documentation](https://github.com/pry/pry)
- [Railsガイド - Git](https://guides.rubyonrails.org/)

## 次のステップ

これでフェーズ1が完了です。次は実際にRailsアプリケーションの開発に進みます！
