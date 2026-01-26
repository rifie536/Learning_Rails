# 教材生成スクリプト

このディレクトリには、Learning Rails カリキュラムの教材生成を補助するスクリプトが含まれています。

## ⚠️ 重要: スクリプトの位置づけ

このスクリプトは **基本構造を自動生成** し、**手動で調整する** ワークフローです。

### スクリプトでできること
- ✅ 基本的なディレクトリ構造の生成
- ✅ solutions/ から exercises/ への TODO テンプレート変換
- ✅ コメント部分（要件、説明）の保持
- ✅ テストコードの保持
- ✅ exercises/README.md の基本版生成
- ✅ exercises.md の参照先更新

### スクリプトでできないこと（手動調整が必要）
- ❌ コンテキストを理解したヒントの生成（プレースホルダーが挿入される）
- ❌ 難易度に応じたヒントの調整
- ❌ ハイブリッド形式のガイドファイル作成（Git, Bundler 等）

### 改善点（2026-01-26）

スクリプトを改良し、以下が可能になりました：
- ✅ solutions/ のコメントセクションを正確に抽出
- ✅ テストコードを正確に保持
- ✅ TODO コメント + ヒントプレースホルダーを自動挿入

## スクリプト一覧

### generate_exercises.rb

`solutions/` ディレクトリから `exercises/` ディレクトリの基本構造を生成するスクリプトです。

**機能:**
- `exercises/` ディレクトリを作成
- `exercises/README.md` を生成（基本版）
- `exercises.md` を修正（`solutions/` → `exercises/` に変更）
- `README.md` を修正（学習の流れ、ファイル構成を更新）

**使用方法:**

```bash
# 特定の Day に対して実行
ruby scripts/generate_exercises.rb curriculum/phase_01/day_XXX

# Phase 1 のすべての Day に対して実行
ruby scripts/generate_exercises.rb --all-phase1
```

**注意事項:**
- 既存の `exercises/*.rb` ファイルはスキップされます（上書きしません）
- `solutions/` ディレクトリが存在しない場合はスキップされます
- 生成されたファイルには自動的に実行権限が付与されます
- **生成後、必ず手動で品質を確認・調整してください**

## 推奨ワークフロー

高品質な教材を作成するための推奨手順：

### ステップ1: solutions/ と examples/ を作成

```bash
cd curriculum/phase_01/day_XXX
mkdir -p solutions examples

# 完成版のコードを作成
vim solutions/exercise1.rb
vim solutions/exercise2.rb
# ...

# サンプルコードを作成
vim examples/01_topic.rb
```

### ステップ2: スクリプトで基本構造を生成

```bash
ruby scripts/generate_exercises.rb curriculum/phase_01/day_XXX
```

これにより以下が自動生成されます：
- `exercises/` ディレクトリ
- `exercises/exercise*.rb`（TODO テンプレート版）
- `exercises/README.md`（基本版）
- `exercises.md` と `README.md` の更新

### ステップ3: 手動で調整

生成された `exercises/*.rb` を調整：

```ruby
# 生成されたファイル
# TODO: ここに実装してください
# ヒント: 適切なヒントをここに追加してください

# ↓ 手動で調整

# TODO: ここにrepeatメソッドを実装してください
# ヒント: times メソッドと block.call を使用します
```

### ステップ4: 実行権限を確認

```bash
chmod +x curriculum/phase_01/day_XXX/exercises/*.rb
chmod +x curriculum/phase_01/day_XXX/solutions/*.rb
```

### ステップ5: 動作確認

```bash
ruby solutions/exercise1.rb  # ✅ 正常に動作
ruby exercises/exercise1.rb  # ❌ TODO エラー（期待通り）
```

**結論**: スクリプトで基本構造を生成し、**ヒントを手動で調整**することで効率的に作成できます。

## 教材作成ガイドライン

詳細な教材作成ガイドラインは `curriculum/CURRICULUM_TEMPLATE.md` を参照してください。

## 学習スタイル

現在、以下の2つの学習スタイルがあります：

1. **TODO テンプレート形式**（Day 2, 4）- 標準スタイル
2. **ハイブリッド形式**（Day 5）- ツール演習用

詳細は `curriculum/CURRICULUM_TEMPLATE.md` を参照してください。
