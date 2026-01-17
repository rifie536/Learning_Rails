# Rails 140日完全マスター学習プロジェクト

Ruby on Railsを140日間で基礎から実践まで完全にマスターするための学習プロジェクトです。

## 📋 プロジェクト構成

```
Learning_Rails/
├── README.md                    # このファイル
├── rails_100days_plan.md        # 140日学習プラン（詳細版）
├── curriculum/                  # 日別学習教材
│   ├── README.md
│   ├── phase_01/               # Phase 1: Ruby復習（Day 1-5）✅
│   ├── phase_02/               # Phase 2: Rails入門（Day 6-25）
│   └── ...
└── tools/                       # 教材生成ツール
    ├── README.md
    └── generate_curriculum.rb  # 自動生成スクリプト
```

## 🎯 このプロジェクトで得られるスキル

### 基礎スキル
- Ruby（復習）
- Rails MVC
- RESTful設計
- データベース設計
- Git/GitHub

### テスト
- TDD（テスト駆動開発）
- Minitest
- RSpec
- システムテスト（Capybara）
- テストカバレッジ80%以上

### Active Record
- マイグレーション
- バリデーション
- 関連付け（1対多、多対多）
- ポリモーフィック関連
- STI（単一テーブル継承）
- クエリ最適化
- N+1問題対策
- トランザクション/ロック

### 認証・認可
- セッション管理
- パスワード暗号化
- Remember me
- アカウント有効化
- パスワード再設定
- 管理者権限

### フロントエンド
- ERBテンプレート
- レイアウト/パーシャル
- フォームヘルパー
- Asset Pipeline（Propshaft）
- Hotwire（Turbo/Stimulus）

### API開発
- JSONレスポンス
- jbuilder/Serializer
- API設計・バージョニング
- トークン認証/JWT
- CORS設定

### 実践機能
- Action Mailer（メール送信）
- Active Storage（ファイルアップロード）
- Action Text（リッチテキスト）
- Active Job（バックグラウンドジョブ）
- Sidekiq/Redis
- Action Cable（WebSocket）
- I18n（国際化）
- キャッシュ戦略

### デプロイ・運用
- 本番環境設定
- PostgreSQL
- Docker/Kamal
- CI/CD（GitHub Actions）
- ログ管理
- エラー追跡
- パフォーマンス監視

## 🚀 クイックスタート

### 1. 学習プランを確認

```bash
# 140日間の詳細な学習プランを確認
cat rails_100days_plan.md
```

### 2. Day 1から開始

```bash
cd curriculum/phase_01/day_001
cat README.md

# 環境構築スクリプトを実行
ruby check_environment.rb
```

### 3. 日々の学習を進める

```bash
# 各日のREADMEで学習目標を確認
# サンプルコードを実行
# 演習課題に取り組む
# 解答例で確認
```

## 🛠️ 教材生成ツール

Phase 2以降の教材は、教材生成ツールで必要な時に作成できます。

```bash
cd tools

# 使い方を確認
cat README.md

# 特定の日を生成
./generate_curriculum.rb day 10

# 範囲を指定して生成
./generate_curriculum.rb range 6 25

# Phase全体を生成
./generate_curriculum.rb phase 2

# 全て生成（Day 1-140）
./generate_curriculum.rb all
```

## 📚 ファイル説明

### rails_100days_plan.md
140日間の詳細な学習プランです。各Phaseの内容、日別のトピック、学習目標が記載されています。

**Phase構成:**
- Phase 1 (Day 1-5): Ruby復習 & 環境構築
- Phase 2 (Day 6-25): Rails入門 & テスト基礎
- Phase 3 (Day 26-40): 認証システム自作
- Phase 4 (Day 41-55): Active Record詳解
- Phase 5 (Day 56-65): Active Record応用
- Phase 6 (Day 66-75): メール & アカウント機能
- Phase 7 (Day 76-85): フォロー機能実装
- Phase 8 (Day 86-93): ルーティング & コントローラ詳解
- Phase 9 (Day 94-105): ビュー層 & Hotwire
- Phase 10 (Day 106-113): API開発
- Phase 11 (Day 114-125): 実践機能
- Phase 12 (Day 126-130): RSpec & 高度なテスト
- Phase 13 (Day 131-138): デプロイ & 運用
- Phase 14 (Day 139-140): 総仕上げ

### curriculum/
日別の学習教材が格納されています。

**Phase 1（Day 1-5）は完成済み:**
- 詳細な解説
- 豊富なサンプルコード
- 実践的な演習課題
- 完全な解答例

**Phase 2以降:**
- 教材生成ツールで作成
- テンプレートベース
- 必要に応じてカスタマイズ

### tools/
教材を自動生成するスクリプトです。

**機能:**
- 学習プランの解析
- 指定された日数の教材生成
- テンプレートベースの構造化

## 📖 学習の進め方

### 推奨学習ルーティン（毎日2時間）

```
1. テスト作成 (15分)
   - 今日実装する機能のテストを先に書く
   - Red（失敗）を確認

2. 理論学習 (20分)
   - Railsガイドを読む
   - 概念を理解する

3. 実装 (60分)
   - テストが通るコードを書く
   - Green（成功）を確認
   - Refactor（リファクタリング）

4. 復習・コミット (15分)
   - git commit
   - 学んだことをメモ
```

### 学習のコツ

1. **TDDを徹底** - 必ずテストを先に書く習慣をつける
2. **毎日継続** - 1日2時間程度の学習を140日間継続
3. **手を動かす** - 読むだけでなく必ずコードを書く
4. **エラーを恐れない** - エラーメッセージを読んで解決する習慣
5. **コミット習慣** - 小さな変更でもこまめにGitコミット
6. **1つのアプリに集中** - MiniSocialを完成させることに注力
7. **ドキュメントを読む** - Railsガイドは最高の教材

## 🏆 成果物: MiniSocial

学習を通じて、Twitter風のSNSアプリ「MiniSocial」を段階的に構築します。

**最終的な機能:**
- ユーザー登録・認証（自作実装）
- アカウント有効化メール
- パスワード再設定
- 投稿（マイクロポスト）のCRUD
- 画像アップロード
- フォロー/フォロワー機能
- リアルタイム通知
- いいね機能（Hotwire）
- コメント機能（ポリモーフィック）
- リッチテキスト投稿（Action Text）
- API（v1）エンドポイント

## 📚 参考リソース

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

## 💬 よくある質問

### Q: Phase 1以外の教材が空なのですが？

A: Phase 2以降は教材生成ツールで必要な時に作成します。

```bash
cd tools
./generate_curriculum.rb phase 2
```

### Q: 生成された教材をカスタマイズできますか？

A: はい、生成後に自由に編集できます。テンプレートは骨組みのみなので、具体的な内容は追加してください。

### Q: 1日2時間も取れません...

A: 週末にまとめて学習するなど、自分のペースで調整してください。重要なのは継続することです。

### Q: 途中から始めることはできますか？

A: はい。ただし、Phase 1-3は基礎なので、ある程度Rails経験がある方向けです。

## 🎓 140日後のあなた

この計画を完了すると：

1. **ポートフォリオ**: 本番稼働するSNSアプリ「MiniSocial」
2. **テストスキル**: TDD習慣、RSpec、カバレッジ80%以上
3. **実務スキル**: API開発、Hotwire、バックグラウンドジョブ、リアルタイム通信
4. **運用スキル**: CI/CD、監視、ログ管理
5. **即戦力**: Railsエンジニアとして実務に参画できるレベル

## 📝 ライセンス

この学習教材は学習目的で自由に使用・改変できます。

---

**さあ、140日間の旅を始めましょう！🚀**

Day 1から始めてください:
```bash
cd curriculum/phase_01/day_001
cat README.md
```
