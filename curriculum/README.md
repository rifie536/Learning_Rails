# Rails 140日学習カリキュラム

Ruby on Railsを140日間で完全マスターするための学習教材です。

## 📚 構成

このカリキュラムは14のPhaseに分かれており、段階的にRailsをマスターできます。

### Phase 1: Ruby復習 & 環境構築 (Day 1-5) ✅

| Day | トピック | 状態 |
|-----|---------|------|
| 1 | 環境構築 | ✅ 完成 |
| 2 | Ruby復習1（ブロック、Proc、Lambda） | ✅ 完成 |
| 3 | Ruby復習2（クラス、モジュール） | ✅ 完成 |
| 4 | Ruby復習3（メタプログラミング） | ✅ 完成 |
| 5 | 開発ツール（Git、Bundler） | ✅ 完成 |

### Phase 2-14: Rails学習 (Day 6-140)

- Phase 2: Rails入門 & テスト基礎 (Day 6-25)
- Phase 3: 認証システム自作 (Day 26-40)
- Phase 4: Active Record詳解 (Day 41-55)
- Phase 5: Active Record応用 (Day 56-65)
- Phase 6: メール & アカウント機能 (Day 66-75)
- Phase 7: フォロー機能実装 (Day 76-85)
- Phase 8: ルーティング & コントローラ詳解 (Day 86-93)
- Phase 9: ビュー層 & Hotwire (Day 94-105)
- Phase 10: API開発 (Day 106-113)
- Phase 11: 実践機能 (Day 114-125)
- Phase 12: RSpec & 高度なテスト (Day 126-130)
- Phase 13: デプロイ & 運用 (Day 131-138)
- Phase 14: 総仕上げ (Day 139-140)

詳細は [学習プラン](../rails_100days_plan.md) を参照してください。

## 🚀 始め方

### 1. 環境構築から開始

```bash
cd phase_01/day_001
cat README.md
```

Day 1の指示に従って開発環境をセットアップしてください。

### 2. 各日の学習の流れ

```bash
# 1. READMEで学習目標を確認
cat README.md

# 2. サンプルコードを実行
ruby examples/01_example.rb

# 3. 演習課題に取り組む
cat exercises.md

# 4. 解答を実装
ruby solutions/exercise1.rb
```

### 3. 教材生成ツールの使用

Phase 2以降の教材は、必要に応じて生成ツールで作成できます。

```bash
cd ../tools

# 特定の日を生成
./generate_curriculum.rb day 6

# 範囲を指定して生成
./generate_curriculum.rb range 6 25

# Phase全体を生成
./generate_curriculum.rb phase 2
```

詳細は [tools/README.md](../tools/README.md) を参照してください。

## 📂 ディレクトリ構造

```
curriculum/
├── README.md              # このファイル
├── phase_01/              # Phase 1: Ruby復習 & 環境構築
│   ├── day_001/          # Day 1: 環境構築
│   │   ├── README.md
│   │   ├── setup_guide.md
│   │   ├── check_environment.rb
│   │   └── exercises.md
│   ├── day_002/          # Day 2: Ruby復習1
│   │   ├── README.md
│   │   ├── examples/
│   │   ├── exercises.md
│   │   └── solutions/
│   └── ...
├── phase_02/              # Phase 2: Rails入門
│   ├── day_006/
│   └── ...
└── ...
```

各日のディレクトリには以下が含まれます：

- `README.md` - 学習目標と概要
- `examples/` - サンプルコード
- `exercises.md` - 演習課題
- `solutions/` - 解答例

## 🎯 学習のコツ

### 1. 毎日継続する

1日2時間程度の学習を140日間継続することが重要です。

### 2. TDDを実践する

Phase 2以降はテスト駆動開発を徹底します。

```
1. テスト作成 (15分)
2. 理論学習 (20分)
3. 実装 (60分)
4. 復習・コミット (15分)
```

### 3. 手を動かす

読むだけでなく、必ずコードを書いて実行してください。

### 4. エラーを恐れない

エラーメッセージを読んで解決する習慣をつけましょう。

### 5. Gitでコミット

小さな変更でもこまめにコミットする習慣を身につけます。

## 📖 参考リソース

### 公式ドキュメント
- [Railsガイド日本語版](https://railsguides.jp/) - メイン教材
- [Rails API ドキュメント](https://api.rubyonrails.org/)
- [Hotwire公式](https://hotwired.dev/)

### 書籍
- 「パーフェクト Ruby on Rails」
- 「現場で使える Ruby on Rails 速習実践ガイド」

### オンライン
- [Ruby on Rails チュートリアル](https://railstutorial.jp/)
- [Everyday Rails - RSpecによるRailsテスト入門](https://leanpub.com/everydayrailsrspec-jp)
- [GoRails](https://gorails.com/) - 動画チュートリアル（英語）

## 🏆 マイルストーン

| Phase | 成果物 |
|-------|--------|
| Phase 2 (Day 25) | ユーザー登録機能（テスト付き） |
| Phase 3 (Day 40) | 完全な認証システム（テスト付き） |
| Phase 4 (Day 55) | マイクロポスト機能（テスト付き） |
| Phase 6 (Day 75) | メール認証システム（テスト付き） |
| Phase 7 (Day 85) | フォロー/コメント機能（テスト付き） |
| Phase 9 (Day 105) | Hotwire対応の動的UI（テスト付き） |
| Phase 10 (Day 113) | MiniSocial API v1（テスト付き） |
| Phase 13 (Day 138) | 本番環境、CI/CDパイプライン |
| Phase 14 (Day 140) | MiniSocial完成・公開 |

## 💡 進捗管理

学習の進捗を記録することをお勧めします。

```bash
# 学習記録用ディレクトリを作成
mkdir -p ~/rails_learning_log

# 毎日の学習記録
echo "# Day X - $(date)" >> ~/rails_learning_log/day_X.md
echo "- 学んだこと:" >> ~/rails_learning_log/day_X.md
echo "- 疑問点:" >> ~/rails_learning_log/day_X.md
echo "- 次回やること:" >> ~/rails_learning_log/day_X.md
```

## 🤝 サポート

質問や問題がある場合：

1. まずRailsガイドを確認
2. エラーメッセージをよく読む
3. Stack Overflowで検索
4. Railsコミュニティに質問

## 📝 ライセンス

この学習教材は学習目的で自由に使用・改変できます。

---

**140日後、あなたは Railsエンジニアとして実務に参画できるレベルになっています。**

頑張ってください！🚀
