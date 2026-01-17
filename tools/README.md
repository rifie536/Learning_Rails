# カリキュラム生成ツール

140日分のRails学習教材を自動生成するツールです。

## 機能

- 学習プラン（`rails_100days_plan.md`）を解析
- 指定された日数の教材を自動生成
- README、サンプルコード、演習課題、解答例を含む完全な構成

## 使い方

### 基本コマンド

```bash
# 特定の日を生成
./generate_curriculum.rb day <日数>

# 範囲を指定して生成
./generate_curriculum.rb range <開始日> <終了日>

# Phase全体を生成
./generate_curriculum.rb phase <Phase番号>

# 全て生成（Day 1-140）
./generate_curriculum.rb all
```

### 実行例

```bash
# Day 10の教材を生成
./generate_curriculum.rb day 10

# Day 6-25（Phase 2全体）を生成
./generate_curriculum.rb range 6 25

# Phase 2を生成
./generate_curriculum.rb phase 2

# 全ての教材を生成
./generate_curriculum.rb all
```

## 生成される構成

各日ごとに以下のファイルが生成されます：

```
curriculum/
└── phase_XX/
    └── day_XXX/
        ├── README.md              # 学習目標と概要
        ├── examples/              # サンプルコード
        │   └── 01_example.rb
        ├── exercises.md           # 演習課題
        └── solutions/             # 解答例
            ├── exercise1.rb
            └── exercise2.rb
```

## 生成後のカスタマイズ

生成された教材はテンプレートベースです。以下をカスタマイズしてください：

1. **サンプルコード** (`examples/`)
   - 具体的な実装例を追加
   - コメントで詳しく解説

2. **演習課題** (`exercises.md`)
   - より詳細な要件を記述
   - 使用例を追加

3. **解答例** (`solutions/`)
   - 完全な実装を追加
   - 複数のアプローチを示す

## 推奨ワークフロー

### 方法1: 必要な時に生成

```bash
# 今日学習するPhaseを生成
./generate_curriculum.rb phase 2

# 必要に応じてカスタマイズ
code ../curriculum/phase_02/day_006/
```

### 方法2: 一括生成してから編集

```bash
# 全て生成
./generate_curriculum.rb all

# 各日を順次カスタマイズ
```

### 方法3: 週単位で生成

```bash
# 今週分（Day 6-12）を生成
./generate_curriculum.rb range 6 12
```

## Phase一覧

| Phase | 日数 | 内容 |
|-------|------|------|
| 1 | 1-5 | Ruby復習 & 環境構築 |
| 2 | 6-25 | Rails入門 & テスト基礎 |
| 3 | 26-40 | 認証システム自作 |
| 4 | 41-55 | Active Record詳解 |
| 5 | 56-65 | Active Record応用 |
| 6 | 66-75 | メール & アカウント機能 |
| 7 | 76-85 | フォロー機能実装 |
| 8 | 86-93 | ルーティング & コントローラ詳解 |
| 9 | 94-105 | ビュー層 & Hotwire |
| 10 | 106-113 | API開発 |
| 11 | 114-125 | 実践機能 |
| 12 | 126-130 | RSpec & 高度なテスト |
| 13 | 131-138 | デプロイ & 運用 |
| 14 | 139-140 | 総仕上げ |

## トラブルシューティング

### エラー: Day X の情報が見つかりません

学習プラン（`rails_100days_plan.md`）に該当する日のデータがない可能性があります。
プランファイルを確認してください。

### ファイルが上書きされる

既存のファイルがある場合は上書きされます。
重要な変更がある場合は、先にバックアップを取ってください。

## 注意事項

- **Phase 1（Day 1-5）は手動作成済み**
  - より詳細な内容が含まれています
  - 自動生成で上書きしないことを推奨

- **生成後は必ずカスタマイズ**
  - テンプレートは骨組みのみ
  - 具体的な内容は各自で追加してください

- **学習プランの更新**
  - `rails_100days_plan.md`を更新した場合
  - 再生成で最新の情報を反映できます

## 今後の拡張案

- [ ] より詳細なサンプルコード生成
- [ ] トピックごとの専用テンプレート
- [ ] AI を使った内容生成
- [ ] 進捗管理機能

## ライセンス

このツールは学習目的で自由に使用・改変できます。
