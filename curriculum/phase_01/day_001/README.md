# Day 1: 環境構築

## 学習目標

- Ruby開発環境をセットアップする
- rbenvを使用したRubyのバージョン管理を理解する
- Railsをインストールする
- エディタの基本設定を完了する

## 今日学ぶこと

### 1. rbenvとは

rbenvはRubyのバージョン管理ツールです。複数のRubyバージョンを切り替えて使用できます。

**メリット:**
- プロジェクトごとに異なるRubyバージョンを使用可能
- システムのRubyを汚さない
- 簡単にバージョンアップ/ダウングレードできる

### 2. Homebrewとは

macOS用のパッケージ管理ツールです。開発ツールのインストールを簡単にします。

### 3. 必要なツール

- Homebrew
- rbenv
- ruby-build
- Ruby 3.3.x
- Rails 8.x
- PostgreSQL（後で使用）
- Git

## セットアップ手順

詳細な手順は `setup_guide.md` を参照してください。

## 環境確認

セットアップ完了後、以下のコマンドで環境を確認します：

```bash
ruby check_environment.rb
```

## 演習課題

`exercises.md` の課題に取り組んでください。

## 参考リンク

- [rbenv公式](https://github.com/rbenv/rbenv)
- [Railsガイド - Railsをはじめよう](https://railsguides.jp/getting_started.html)

## 所要時間

- セットアップ: 30-60分
- 確認と演習: 30分
- **合計: 約1-1.5時間**

## 次のステップ

環境構築が完了したら、Day 2でRubyの復習を開始します。
