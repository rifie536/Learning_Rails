# Ruby on Rails 完全マスター学習計画（120日・TDD版）

## 概要

本計画は[Railsガイド日本語版](https://railsguides.jp/)を主な教材として、120日間でRuby on Railsの基礎から実践的な開発スキルまでを**網羅的に**習得することを目的としています。

**特徴**:
- テスト駆動開発（TDD）を最初から実践
- 1つのSNSアプリ「MiniSocial」を段階的に完成
- API開発、高度なルーティング、運用まで完全網羅
- 実務で即戦力になるスキルセット

**前提**: Ruby基礎知識あり

---

## 学習を通じて作成するアプリ: MiniSocial

Twitterライクなミニ SNS アプリを段階的に構築します。

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
- **API（v1）エンドポイント**

---

## Phase 1: Ruby復習 & 環境構築 (Day 1-5)

| 日 | トピック | 学習内容 |
|---|---------|---------|
| 1 | 環境構築 | Ruby/Railsインストール、rbenv設定、エディタ設定 |
| 2 | Ruby復習1 | ブロック、Proc、Lambda、イテレータ |
| 3 | Ruby復習2 | クラス、モジュール、ミックスイン |
| 4 | Ruby復習3 | メタプログラミング基礎（Railsで多用） |
| 5 | 開発ツール | Git、Bundler、デバッグツール（debug gem） |

---

## Phase 2: Rails入門 & テスト基礎 (Day 6-25)

参考: [Railsをはじめよう](https://railsguides.jp/getting_started.html) / [Railsテスティングガイド](https://railsguides.jp/testing.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 6 | Rails概要 | MVC、CoC、DRY原則 | - |
| 7 | アプリ作成 | `rails new mini_social`、ディレクトリ構造 | プロジェクト作成 |
| 8 | テスト入門 | Minitest基礎、テストの種類、Red-Green-Refactor | - |
| 9 | 静的ページ | コントローラ作成、TDDで実装 | Home/About/Helpページ |
| 10 | ルーティング基礎 | routes.rb、GET/POST/PUT/DELETE | - |
| 11 | ビュー基礎 | ERBテンプレート、レイアウト | 共通レイアウト作成 |
| 12 | モデル基礎 | `rails generate model`、テスト作成 | - |
| 13 | モデルテスト | ユニットテストの書き方、fixtures | - |
| 14 | マイグレーション | `rails db:migrate`、スキーマ管理 | - |
| 15 | バリデーション | presence、length、format + テスト | - |
| 16 | Userモデル1 | name、emailのバリデーション（TDD） | Userモデル作成 |
| 17 | Userモデル2 | emailの一意性、大文字小文字 | インデックス追加 |
| 18 | セキュアパスワード | has_secure_password、bcrypt | password_digest追加 |
| 19 | RESTful設計 | resourcesルーティング | - |
| 20 | フォーム作成 | form_with ヘルパー | - |
| 21 | ユーザー登録1 | newアクション、フォーム（TDD） | 登録フォーム |
| 22 | ユーザー登録2 | createアクション、エラー表示 | 登録処理完成 |
| 23 | 統合テスト入門 | 統合テストの書き方 | 登録フローのテスト |
| 24 | Flash/リダイレクト | flash、redirect_to | 登録成功メッセージ |
| 25 | Phase 2復習 | コードリファクタリング、テスト整理 | - |

**Phase 2 成果物**: ユーザー登録機能（テスト付き）

---

## Phase 3: 認証システム自作 (Day 26-40)

参考: [Action Controllerの概要](https://railsguides.jp/action_controller_overview.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 26 | セッション基礎 | session、cookies、HTTPステートレス | - |
| 27 | ログインフォーム | SessionsController、new/create | ログインページ |
| 28 | ログイン処理 | session[:user_id]、current_user | ログイン機能 |
| 29 | ログアウト | destroyアクション、session.delete | ログアウト機能 |
| 30 | ログインテスト | 統合テスト、ヘルパーメソッド | テスト追加 |
| 31 | Remember me 1 | remember_token、remember_digest | DB設計 |
| 32 | Remember me 2 | 永続的セッション、cookies.permanent | 実装 |
| 33 | Remember me 3 | セキュリティ考慮、テスト | テスト追加 |
| 34 | ユーザー表示 | showアクション、プロフィールページ | プロフィール |
| 35 | ユーザー編集 | edit/updateアクション（TDD） | 編集機能 |
| 36 | 認可 | before_action、correct_user | アクセス制御 |
| 37 | フレンドリーURL | リダイレクト先の保存 | UX改善 |
| 38 | ユーザー一覧 | index、ページネーション（kaminari） | 一覧ページ |
| 39 | ユーザー削除 | destroy、管理者権限 | 管理者機能 |
| 40 | Phase 3復習 | セキュリティ確認、リファクタリング | - |

**Phase 3 成果物**: 完全な認証システム（テスト付き）

---

## Phase 4: Active Record詳解 (Day 41-55)

参考:
- [Active Recordの基礎](https://railsguides.jp/active_record_basics.html)
- [Active Recordマイグレーション](https://railsguides.jp/active_record_migrations.html)
- [Active Recordバリデーション](https://railsguides.jp/active_record_validations.html)
- [Active Recordクエリ](https://railsguides.jp/active_record_querying.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 41 | ARの基礎 | 命名規則、CRUD操作 | - |
| 42 | マイグレーション1 | カラム追加・変更・削除 | - |
| 43 | マイグレーション2 | インデックス、外部キー制約 | - |
| 44 | マイグレーション3 | ロールバック、スキーマ管理 | - |
| 45 | バリデーション詳解1 | 標準バリデーション全種類 | - |
| 46 | バリデーション詳解2 | カスタムバリデーション、条件付き | - |
| 47 | コールバック | before_save、after_create等 | email小文字化 |
| 48 | 関連付け1 | has_many、belongs_to | - |
| 49 | 関連付け2 | dependent: :destroy、テスト | - |
| 50 | マイクロポスト1 | Micropostモデル作成（TDD） | 投稿モデル |
| 51 | マイクロポスト2 | User関連付け、バリデーション | 関連付け |
| 52 | マイクロポスト3 | 投稿フォーム、作成処理 | 投稿機能 |
| 53 | マイクロポスト4 | 投稿一覧、削除機能 | 一覧・削除 |
| 54 | クエリ詳解 | where、order、limit、offset | デフォルトスコープ |
| 55 | スコープ | scope定義、メソッドチェーン | - |

**Phase 4 成果物**: マイクロポスト機能（テスト付き）

---

## Phase 5: Active Record応用 (Day 56-65)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 56 | クエリ最適化1 | joins、includes、eager loading | - |
| 57 | クエリ最適化2 | preload、eager_load使い分け | - |
| 58 | N+1問題 | 検出と解決、Bullet gem導入 | パフォーマンス改善 |
| 59 | トランザクション1 | ACID特性、基本的な使い方 | - |
| 60 | トランザクション2 | 楽観的ロック、悲観的ロック | - |
| 61 | 多対多の関連 | has_many :through | - |
| 62 | 自己結合 | Relationshipモデル設計 | フォロー設計 |
| 63 | ポリモーフィック関連 | commentable等の設計パターン | コメント設計 |
| 64 | STI | 単一テーブル継承、使いどころ | - |
| 65 | AR演習 | 複雑なクエリ実装、パフォーマンス計測 | - |

**Phase 5 成果物**: 最適化されたクエリ、コメント機能設計

---

## Phase 6: メール & アカウント機能 (Day 66-75)

参考: [Action Mailer](https://railsguides.jp/action_mailer_basics.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 66 | Action Mailer基礎 | メーラー作成、設定 | - |
| 67 | メールテンプレート | HTML/テキスト、レイアウト | - |
| 68 | メールプレビュー | 開発環境でのテスト | - |
| 69 | アカウント有効化1 | activation_token設計 | DBカラム追加 |
| 70 | アカウント有効化2 | 有効化メール送信 | メール送信 |
| 71 | アカウント有効化3 | 有効化処理、テスト | 有効化完成 |
| 72 | パスワード再設定1 | reset_token設計 | DBカラム追加 |
| 73 | パスワード再設定2 | 再設定メール、フォーム | メール送信 |
| 74 | パスワード再設定3 | パスワード更新、期限 | 再設定完成 |
| 75 | メール機能テスト | メーラーテスト、統合テスト | テスト追加 |

**Phase 6 成果物**: メール認証システム（テスト付き）

---

## Phase 7: フォロー機能実装 (Day 76-85)

参考: [Active Record関連付け](https://railsguides.jp/association_basics.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 76 | フォロー実装1 | following、followers関連 | モデル実装 |
| 77 | フォロー実装2 | follow/unfollowメソッド | メソッド追加 |
| 78 | フォローUI | フォローボタン、統計表示 | UI実装 |
| 79 | フォローテスト | 関連付けテスト、統合テスト | テスト追加 |
| 80 | フィード1 | ステータスフィード設計 | SQL検討 |
| 81 | フィード2 | サブクエリ実装 | フィード実装 |
| 82 | フィードテスト | フィードのテスト | テスト追加 |
| 83 | コメント機能1 | Commentモデル（ポリモーフィック） | コメント実装 |
| 84 | コメント機能2 | コメントCRUD、テスト | コメント完成 |
| 85 | Phase 7復習 | パフォーマンス確認、リファクタリング | - |

**Phase 7 成果物**: フォロー/フォロワー機能、コメント機能（テスト付き）

---

## Phase 8: ルーティング & コントローラ詳解 (Day 86-93)

参考: [Railsルーティング](https://railsguides.jp/routing.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 86 | ルーティング詳解1 | 名前付きルート、リソース詳細 | - |
| 87 | ルーティング詳解2 | namespace、scope | api/v1準備 |
| 88 | ルーティング詳解3 | concerns、ルーティングDRY化 | - |
| 89 | ルーティング詳解4 | ネストリソース、shallow | - |
| 90 | コントローラ詳解1 | フィルタ（before/after/around） | - |
| 91 | コントローラ詳解2 | Strong Parameters詳解 | - |
| 92 | コントローラ詳解3 | respond_to、複数フォーマット | - |
| 93 | ルーティング演習 | 複雑なルーティング設計 | ルーティング整理 |

**Phase 8 成果物**: 整理されたルーティング構造

---

## Phase 9: ビュー層 & Hotwire (Day 94-105)

参考:
- [Action Viewの概要](https://railsguides.jp/action_view_overview.html)
- [Action Viewフォームヘルパー](https://railsguides.jp/form_helpers.html)
- [レイアウトとレンダリング](https://railsguides.jp/layouts_and_rendering.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 94 | レイアウト詳解 | yield、content_for、提供 | - |
| 95 | レンダリング詳解 | render options、テンプレート選択 | - |
| 96 | パーシャル詳解 | コレクション、ローカル変数、キャッシュ | リファクタリング |
| 97 | ヘルパー詳解 | カスタムヘルパー作成、ベストプラクティス | ヘルパー整理 |
| 98 | フォーム詳解1 | form_with詳細オプション | - |
| 99 | フォーム詳解2 | ネストフォーム、accepts_nested_attributes | - |
| 100 | Asset Pipeline | Propshaft、Import maps、CSS/JS管理 | - |
| 101 | Hotwire入門 | Turbo、Stimulus概要 | - |
| 102 | Turbo Drive/Frames | ページ遷移高速化、部分更新 | フォローボタン |
| 103 | Turbo Streams | リアルタイム更新 | 投稿の即時反映 |
| 104 | Stimulus | JavaScript連携、コントローラ | 文字数カウンター |
| 105 | いいね機能 | Hotwireでいいね実装（TDD） | いいね機能 |

**Phase 9 成果物**: Hotwire対応の動的UI（テスト付き）

---

## Phase 10: API開発 (Day 106-113)

参考: [RailsによるAPI専用アプリ](https://railsguides.jp/api_app.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 106 | API基礎 | JSONレスポンス、ステータスコード | - |
| 107 | jbuilder | JSONテンプレート作成 | - |
| 108 | ActiveModel::Serializer | シリアライザー設計 | - |
| 109 | API設計 | RESTful API設計原則、バージョニング | api/v1作成 |
| 110 | API認証1 | トークン認証基礎 | - |
| 111 | API認証2 | JWT認証の概要 | API認証実装 |
| 112 | CORS設定 | rack-cors、フロントエンド連携 | CORS設定 |
| 113 | APIテスト | リクエストスペック、APIドキュメント | テスト追加 |

**Phase 10 成果物**: MiniSocial API v1（テスト付き）

---

## Phase 11: 実践機能 (Day 114-125)

参考:
- [Active Job](https://railsguides.jp/active_job_basics.html)
- [Active Storage](https://railsguides.jp/active_storage_overview.html)
- [Action Cable](https://railsguides.jp/action_cable_overview.html)
- [Action Text](https://railsguides.jp/action_text_overview.html)

| 日 | トピック | 学習内容 | MiniSocial進捗 |
|---|---------|---------|----------------|
| 114 | Active Storage1 | ファイルアップロード基礎 | - |
| 115 | Active Storage2 | 画像処理、バリデーション | 投稿に画像添付 |
| 116 | Active Storage3 | クラウドストレージ（S3等） | - |
| 117 | Action Text | リッチテキスト編集（Trix） | リッチテキスト投稿 |
| 118 | Active Job1 | バックグラウンドジョブ基礎 | - |
| 119 | Active Job2 | Sidekiq連携、Redis設定 | メール非同期化 |
| 120 | Action Cable1 | WebSocket、Channel基礎 | - |
| 121 | Action Cable2 | リアルタイム通知実装 | 通知機能 |
| 122 | I18n | 国際化、多言語対応 | 日本語化 |
| 123 | キャッシュ1 | フラグメントキャッシュ | - |
| 124 | キャッシュ2 | Russian Doll Caching、Redis | パフォーマンス |
| 125 | セキュリティ | CSRF、XSS、SQLインジェクション確認 | セキュリティ監査 |

**Phase 11 成果物**: 画像アップロード、リッチテキスト、通知機能（テスト付き）

---

## Phase 12: RSpec & 高度なテスト (Day 126-130)

| 日 | トピック | 学習内容 |
|---|---------|---------|
| 126 | RSpec入門 | describe、it、expect、Minitestとの違い |
| 127 | RSpec実践 | FactoryBot、let、before、shared_examples |
| 128 | システムテスト | Capybara、E2Eテスト |
| 129 | テストカバレッジ | SimpleCov、カバレッジ80%以上達成 |
| 130 | テストリファクタリング | 既存テストの整理、CI向け最適化 |

**Phase 12 成果物**: RSpecテスト、カバレッジ80%以上

---

## Phase 13: デプロイ & 運用 (Day 131-138)

参考: [本番環境へのデプロイ](https://railsguides.jp/getting_started.html#本番環境へのデプロイ)

| 日 | トピック | 学習内容 |
|---|---------|---------|
| 131 | 本番環境設定 | config/environments/production.rb詳解 |
| 132 | データベース設定 | PostgreSQL、DATABASE_URL、環境変数 |
| 133 | Kamal入門1 | Docker基礎、Dockerfile作成 |
| 134 | Kamal入門2 | Kamal設定、デプロイ準備 |
| 135 | CI/CD1 | GitHub Actions、自動テスト |
| 136 | CI/CD2 | 自動デプロイ、ワークフロー最適化 |
| 137 | 監視・運用1 | ログ管理、Lograge |
| 138 | 監視・運用2 | エラー追跡（Sentry等）、パフォーマンス監視 |

**Phase 13 成果物**: 本番環境デプロイ、CI/CDパイプライン

---

## Phase 14: 総仕上げ (Day 139-140)

| 日 | トピック | 学習内容 |
|---|---------|---------|
| 139 | 最終調整 | バグ修正、UI/UX改善、READMEの作成 |
| 140 | 公開・振り返り | 本番公開、ポートフォリオ化、140日の総括 |

**Phase 14 成果物**: MiniSocialを本番環境に公開

---

## 日々の学習ルーティン（推奨）

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

---

## 推奨リソース

### 公式ドキュメント
- [Railsガイド日本語版](https://railsguides.jp/) - メイン教材
- [Rails API ドキュメント](https://api.rubyonrails.org/)
- [Hotwire公式](https://hotwired.dev/)

### 書籍
- 「パーフェクト Ruby on Rails」
- 「現場で使える Ruby on Rails 速習実践ガイド」

### オンライン
- [Ruby on Rails チュートリアル](https://railstutorial.jp/) - 認証部分の参考に
- [Everyday Rails - RSpecによるRailsテスト入門](https://leanpub.com/everydayrailsrspec-jp)
- [GoRails](https://gorails.com/) - 動画チュートリアル（英語）

---

## 各Phase完了時の成果物

| Phase | Day | 成果物 |
|-------|-----|--------|
| Phase 2 | 25 | ユーザー登録機能（テスト付き） |
| Phase 3 | 40 | 完全な認証システム（テスト付き） |
| Phase 4 | 55 | マイクロポスト機能（テスト付き） |
| Phase 5 | 65 | 最適化されたクエリ、コメント設計 |
| Phase 6 | 75 | メール認証システム（テスト付き） |
| Phase 7 | 85 | フォロー/コメント機能（テスト付き） |
| Phase 8 | 93 | 整理されたルーティング構造 |
| Phase 9 | 105 | Hotwire対応の動的UI（テスト付き） |
| Phase 10 | 113 | MiniSocial API v1（テスト付き） |
| Phase 11 | 125 | 画像、リッチテキスト、通知機能 |
| Phase 12 | 130 | RSpecテスト、カバレッジ80%以上 |
| Phase 13 | 138 | 本番環境、CI/CDパイプライン |
| Phase 14 | 140 | MiniSocial完成・公開 |

---

## スキルマップ

本計画で習得できるスキル一覧：

### 基礎スキル
- [x] Ruby（復習）
- [x] Rails MVC
- [x] RESTful設計
- [x] データベース設計
- [x] Git/GitHub

### テスト
- [x] TDD（テスト駆動開発）
- [x] Minitest
- [x] RSpec
- [x] システムテスト（Capybara）
- [x] テストカバレッジ

### Active Record
- [x] マイグレーション
- [x] バリデーション
- [x] 関連付け（1対多、多対多）
- [x] ポリモーフィック関連
- [x] STI（単一テーブル継承）
- [x] クエリ最適化
- [x] N+1問題対策
- [x] トランザクション/ロック

### 認証・認可
- [x] セッション管理
- [x] パスワード暗号化
- [x] Remember me
- [x] アカウント有効化
- [x] パスワード再設定
- [x] 管理者権限

### ビュー・フロントエンド
- [x] ERBテンプレート
- [x] レイアウト/パーシャル
- [x] フォームヘルパー
- [x] Asset Pipeline（Propshaft）
- [x] Hotwire（Turbo/Stimulus）

### API開発
- [x] JSONレスポンス
- [x] jbuilder/Serializer
- [x] API設計・バージョニング
- [x] トークン認証/JWT
- [x] CORS設定

### 実践機能
- [x] Action Mailer（メール送信）
- [x] Active Storage（ファイルアップロード）
- [x] Action Text（リッチテキスト）
- [x] Active Job（バックグラウンドジョブ）
- [x] Sidekiq/Redis
- [x] Action Cable（WebSocket）
- [x] I18n（国際化）
- [x] キャッシュ戦略

### ルーティング
- [x] 基本ルーティング
- [x] namespace/scope
- [x] concerns
- [x] ネストリソース/shallow

### デプロイ・運用
- [x] 本番環境設定
- [x] PostgreSQL
- [x] Docker/Kamal
- [x] CI/CD（GitHub Actions）
- [x] ログ管理
- [x] エラー追跡
- [x] パフォーマンス監視

### セキュリティ
- [x] CSRF対策
- [x] XSS対策
- [x] SQLインジェクション対策
- [x] Strong Parameters

---

## 学習のコツ

1. **TDDを徹底** - 必ずテストを先に書く習慣をつける
2. **毎日継続** - 1日2時間程度の学習を140日間継続
3. **手を動かす** - 読むだけでなく必ずコードを書く
4. **エラーを恐れない** - エラーメッセージを読んで解決する習慣
5. **コミット習慣** - 小さな変更でもこまめにGitコミット
6. **1つのアプリに集中** - MiniSocialを完成させることに注力
7. **ドキュメントを読む** - Railsガイドは最高の教材

---

## Railsチュートリアルとの対応表

本計画はRailsチュートリアルの良い点を取り入れつつ、より網羅的な内容になっています。

| Railsチュートリアル | 本計画 |
|-------------------|--------|
| 第1-5章（基礎） | Phase 2 |
| 第6-10章（認証） | Phase 3 |
| 第11-12章（メール） | Phase 6 |
| 第13章（投稿） | Phase 4 |
| 第14章（フォロー） | Phase 7 |
| - | Phase 5（AR応用、ポリモーフィック） |
| - | Phase 8（高度なルーティング） |
| - | Phase 9（Hotwire） |
| - | Phase 10（API開発） |
| - | Phase 11（実践機能） |
| - | Phase 13（監視・運用） |

---

## 140日後のあなた

この計画を完了すると：

1. **ポートフォリオ**: 本番稼働するSNSアプリ「MiniSocial」
2. **テストスキル**: TDD習慣、RSpec、カバレッジ80%以上
3. **実務スキル**: API開発、Hotwire、バックグラウンドジョブ、リアルタイム通信
4. **運用スキル**: CI/CD、監視、ログ管理
5. **即戦力**: Railsエンジニアとして実務に参画できるレベル

---

*この計画はRails 8.x系を前提としています。*
*参考: https://railsguides.jp/*
