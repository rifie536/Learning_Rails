# Day 5 演習課題

このディレクトリには、Day 5 の演習課題のテンプレートファイルとガイドが含まれています。

## 演習の進め方

Day 5 は Git、Bundler、デバッグの3つの領域に分かれています。

### 1. Git 演習（演習1, 2, 6）

1. **ガイドを読む**: `git_practice_guide.md` を開く
2. **コマンドを実行**: ターミナルでGitコマンドを実行
3. **結果を記録**: 実行結果をファイルに保存
4. **レビューを依頼**: 実行結果を Claude にレビュー依頼

### 2. Bundler 演習（演習3）

1. **ガイドを読む**: `bundler_practice_guide.md` を開く
2. **Gemfile を作成**: テキストエディタで Gemfile を作成
3. **bundle install**: 依存関係をインストール
4. **レビューを依頼**: Gemfile と出力を Claude にレビュー依頼

### 3. デバッグ演習（演習4, 5）

1. **課題を読む**: `../exercises.md` で要件を確認
2. **実装する**: TODO 部分にコードを実装
3. **テストする**: ファイルを実行して動作を確認
4. **レビューを依頼**: Claude にレビュー依頼

## 演習ファイル

### Git 演習
- `git_practice_guide.md` - Git 演習のガイド（演習1, 2, 6）

### Bundler 演習
- `bundler_practice_guide.md` - Bundler 演習のガイド（演習3）

### デバッグ演習
- `debug_exercise.rb` - デバッグスキル（演習4）
- `complex_debug.rb` - 複合デバッグ（演習5）

## 実行方法

### Git 演習

```bash
# ガイドに従って Git コマンドを実行
mkdir ~/git_practice
cd ~/git_practice
git init
# ...（詳細は git_practice_guide.md を参照）
```

### Bundler 演習

```bash
# ガイドに従って Bundler を実行
mkdir ~/bundler_practice
cd ~/bundler_practice
# Gemfile を作成
bundle install
# ...（詳細は bundler_practice_guide.md を参照）
```

### デバッグ演習

```bash
# 個別に実行
ruby debug_exercise.rb
ruby complex_debug.rb
```

## レビューの依頼方法

演習を完了したら、以下のように Claude に依頼してください：

### パターン1: Git 演習のレビュー

```
Git 演習1を完了しました。git_basic_log.txt をレビューしてください。
```

### パターン2: Bundler 演習のレビュー

```
Bundler 演習を完了しました。Gemfile と bundler_output.txt をレビューしてください。
```

### パターン3: デバッグ演習のレビュー

```
debug_exercise.rb をレビューしてください。
```

```
complex_debug.rb をレビューしてください。
特に以下の点を確認してください：
- デバッグ出力の適切性
- エラーハンドリング
- バリデーションの追加
```

## Claude のレビュー項目

### Git 演習
- コマンドの正確性
- ブランチ戦略の理解
- コミットメッセージの品質

### Bundler 演習
- Gemfile の記述方法
- 依存関係の管理
- グループの適切な使用

### デバッグ演習
- バグの特定能力
- デバッグ手法の適切性
- コードの修正品質
- エラーハンドリングの実装

## 詰まったら

- `../solutions/` ディレクトリに解答例があります
- ただし、まずは自分で考えることが重要です
- どうしてもわからない場合は、Claude に質問してください

## 学習のヒント

### Git 演習
- コマンドを実行する前に、何が起こるか予測する
- `git status` をこまめに実行して状態を確認
- ブランチの関係を図に描いてみる

### Bundler 演習
- Gemfile.lock の内容を読んで依存関係を理解する
- `bundle list` で実際にインストールされたジェムを確認
- グループごとの役割を理解する

### デバッグ演習
- まずはエラーメッセージをよく読む
- `puts` や `p` でデバッグ出力を追加
- 一つずつ変更して動作を確認
- エラーが発生する前の状態を把握する

頑張ってください！これで Phase 1 が完了です！
