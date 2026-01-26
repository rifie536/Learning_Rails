# 教材作成クイックスタートガイド

新しい Day の教材を作成する際の簡単なガイドです。

## 📌 前提知識

- 教材は**手動作成**が基本です
- スクリプトは補助ツールとして使用します
- Day 2, 4, 5 を参考にしてください

## 🚀 教材作成の手順（4ステップ）

### ステップ1: solutions/ と examples/ を作成

**完成版のコードを作成します**

```bash
cd curriculum/phase_01/day_XXX
mkdir -p solutions examples

# 完成版の演習コードを作成
vim solutions/exercise1.rb
vim solutions/exercise2.rb
# ...

# サンプルコードを作成
vim examples/01_topic.rb
vim examples/02_topic.rb
```

**チェックポイント**:
- [ ] すべての演習の完成版ができている
- [ ] コードが実行できる
- [ ] コメントが適切に書かれている

### ステップ2: スクリプトで基本構造を生成

**自動生成スクリプトを実行します**

```bash
ruby scripts/generate_exercises.rb curriculum/phase_01/day_XXX
```

これにより自動生成されます：
- ✅ `exercises/` ディレクトリ
- ✅ `exercises/exercise*.rb`（TODO テンプレート版）
- ✅ `exercises/README.md`
- ✅ `exercises.md` の更新（参照先が `exercises/` になる）
- ✅ `README.md` の更新（学習の流れを追加）

**チェックポイント**:
- [ ] exercises/ ディレクトリができている
- [ ] exercises/*.rb に TODO コメントがある
- [ ] テストコードが保持されている

### ステップ3: ヒントを手動で調整

**生成された TODO テンプレートのヒントを具体的にします**

```bash
# 生成されたファイルを開く
vim exercises/exercise1.rb
```

```ruby
# 自動生成されたプレースホルダー
# TODO: ここに実装してください
# ヒント: 適切なヒントをここに追加してください

# ↓ 具体的なヒントに書き換え

# TODO: ここにrepeatメソッドを実装してください
# ヒント: times メソッドと yield を使用します
```

**チェックポイント**:
- [ ] ヒントが具体的になっている
- [ ] 難易度に応じてヒントの量を調整
- [ ] exercises/README.md の演習ファイル一覧を確認

### ステップ4: ドキュメントを確認

**README.md, exercises.md, exercises/README.md を作成します**

```bash
# メインの README.md
vim README.md

# 演習課題の説明
vim exercises.md

# exercises ディレクトリの README
vim exercises/README.md
```

**README.md に含める内容**:
- 学習目標
- なぜこれが重要か（Rails での使用例）
- 今日学ぶこと
- 学習の流れ
- ファイル構成

**exercises.md に含める内容**:
- 各演習の要件
- 使用例
- 実装先: `exercises/exerciseN.rb`

**exercises/README.md に含める内容**:
- 演習の進め方
- レビューの依頼方法
- Day 2 または Day 4 をテンプレートとして使用

**チェックポイント**:
- [ ] exercises.md の実装先が `exercises/exerciseN.rb` になっている
- [ ] README.md の学習の流れに「Claude にレビューを依頼する」が含まれている

### ステップ4: 実行権限を付与

```bash
chmod +x exercises/*.rb
chmod +x solutions/*.rb
chmod +x examples/*.rb
```

### ステップ5: 動作確認

```bash
# 各演習を実行してエラーがないか確認
ruby solutions/exercise1.rb
ruby examples/01_topic.rb

# exercises は TODO なのでエラーが出るはず（正常）
ruby exercises/exercise1.rb
```

**チェックポイント**:
- [ ] solutions/ と examples/ がすべて実行できる
- [ ] exercises/ は TODO エラーが出る（期待通り）
- [ ] ファイル構成図が正確

## 📚 参考にすべき Day

### 標準的な Ruby コーディング演習
→ **Day 2 または Day 4 を参考**

### ツール演習が含まれる場合
→ **Day 5 を参考**（ハイブリッド形式）

## ⚠️ よくある間違い

### 間違い1: exercises.md で solutions/ を参照している
```markdown
# ❌ 間違い
`solutions/exercise1.rb`に実装してください。

# ✅ 正しい
`exercises/exercise1.rb`に実装してください。
```

### 間違い2: TODO コメントがない
```ruby
# ❌ 間違い
# 演習1: Bookクラスの作成

class Book
  # 完成版のコードがそのまま
end

# ✅ 正しい
# 演習1: Bookクラスの作成

# TODO: ここにBookクラスを実装してください
# ヒント: attr_accessor を使用します


# テストコード
```

### 間違い3: ヒントがない
```ruby
# ❌ 間違い
# TODO: ここに実装してください

# ✅ 正しい
# TODO: ここに実装してください
# ヒント: send メソッドと respond_to? メソッドを使用します
```

## 🔧 スクリプトを使う場合（オプション）

基本構造の生成のみに使用してください。**その後、必ず手動で調整が必要です**。

```bash
# スクリプト実行
ruby scripts/generate_exercises.rb curriculum/phase_01/day_XXX

# 生成後、必ず以下を手動で調整：
# 1. exercises/*.rb の品質確認
# 2. ヒントの追加
# 3. テストコードの調整
# 4. exercises/README.md の調整
```

## 📖 詳細ガイドライン

詳細は以下を参照してください：
- `curriculum/CURRICULUM_TEMPLATE.md` - 教材作成ガイドライン
- `scripts/README.md` - スクリプトの使い方

## ✅ 最終チェックリスト

教材を公開する前に、以下を確認してください：

- [ ] solutions/ に完成版がある
- [ ] exercises/ に TODO テンプレート版がある
- [ ] examples/ にサンプルコードがある
- [ ] README.md に学習目標と全体像がある
- [ ] exercises.md の実装先が `exercises/exerciseN.rb` になっている
- [ ] exercises/README.md がある
- [ ] すべてのファイルに実行権限がある
- [ ] solutions/ と examples/ が実行できる
- [ ] 適切なヒントが含まれている
- [ ] テストコードが動作する

これで教材作成完了です！お疲れ様でした！
