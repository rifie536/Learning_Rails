# Day 4 演習課題

このディレクトリには、Day 4 の演習課題のテンプレートファイルが含まれています。

## 演習の進め方

1. **課題を読む**: `../exercises.md` で各演習の要件を確認
2. **実装する**: 各 `exercise*.rb` ファイルの TODO 部分にコードを実装
3. **テストする**: 各ファイルを実行して動作を確認
4. **レビューを依頼**: 実装が完了したら Claude にレビューを依頼

## 演習ファイル

- `exercise1.rb` - sendメソッドの活用
- `exercise2.rb` - define_methodでアクセサの自動生成
- `exercise3.rb` - method_missingでfind_by_XXX実装
- `exercise4.rb` - バリデーション機能
- `exercise5.rb` - イベントシステムの構築
- `exercise6.rb` - DSL（Domain Specific Language）でクエリビルダ

## 実行方法

```bash
# 個別に実行
ruby exercise1.rb
ruby exercise2.rb
ruby exercise3.rb
ruby exercise4.rb
ruby exercise5.rb
ruby exercise6.rb

# すべて実行
ruby exercise1.rb && ruby exercise2.rb && ruby exercise3.rb && ruby exercise4.rb && ruby exercise5.rb && ruby exercise6.rb
```

## レビューの依頼方法

演習を完了したら、以下のように Claude に依頼してください：

### パターン1: 個別の演習をレビュー

```
exercise1.rb をレビューしてください
```

### パターン2: すべての演習をレビュー

```
day_004/exercises の演習をすべてレビューしてください
```

### パターン3: 特定の観点でレビュー

```
exercise4.rb をレビューしてください。
特に以下の点を確認してください：
- バリデーションロジックの正確性
- クラス設計の適切性
- エラーハンドリング
```

## Claude のレビュー項目

Claude は以下の観点でコードをレビューします：

1. **正確性**: 要件を満たしているか
2. **Ruby らしさ**: Ruby の慣習に従っているか
3. **可読性**: コードが読みやすいか
4. **効率性**: 適切なメソッドを使用しているか
5. **エッジケース**: 境界条件を考慮しているか
6. **改善提案**: より良い実装方法の提案

## 詰まったら

- `../solutions/` ディレクトリに解答例があります
- ただし、まずは自分で考えることが重要です
- どうしてもわからない場合は、Claude に質問してください

## 学習のヒント

- まずは動くコードを書く（完璧を目指さない）
- テストコードを実行して動作確認
- 解答例と比較して学ぶ
- Claude のレビューを受けて改善する
- 何度も書き直すことで身につく

頑張ってください！
