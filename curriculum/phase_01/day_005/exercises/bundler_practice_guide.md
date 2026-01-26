# Bundler 演習ガイド

このガイドでは、演習3のBundler演習を実施します。

## 演習3: Bundlerの基本操作

### 手順

1. **練習用ディレクトリを作成**
   ```bash
   mkdir ~/bundler_practice
   cd ~/bundler_practice
   ```

2. **Gemfile を作成**

   テキストエディタで `Gemfile` を作成し、以下の内容を記述：

   ```ruby
   source "https://rubygems.org"

   ruby "3.3.6"

   gem "rails", "~> 8.0"
   gem "puma"
   gem "pry-rails"

   group :development do
     gem "rspec"
   end

   group :test do
     gem "capybara"
   end
   ```

3. **bundle install を実行**
   ```bash
   bundle install
   ```

4. **インストールされたジェムを確認**
   ```bash
   bundle list
   ```

5. **Gemfile.lock の内容を確認**
   ```bash
   cat Gemfile.lock
   ```

6. **特定のジェムのバージョンを確認**
   ```bash
   bundle info rails
   ```

### TODO: 以下を実施してください

- [ ] 上記の手順を実行
- [ ] `Gemfile` を作成
- [ ] `bundle install` の出力を `bundler_output.txt` に保存
  ```bash
  bundle install > bundler_output.txt 2>&1
  ```
- [ ] Claude にレビューを依頼

---

## よくある問題と解決方法

### 問題1: Ruby のバージョンが一致しない

**エラー:**
```
Your Ruby version is 3.3.5, but your Gemfile specified 3.3.6
```

**解決方法:**
Gemfile の `ruby "3.3.6"` を現在のRubyバージョンに変更してください。
```bash
ruby -v  # 現在のバージョンを確認
```

### 問題2: ジェムのインストールに失敗

**解決方法:**
```bash
bundle install --verbose  # 詳細なログを表示
```

### 問題3: Gemfile.lock が競合

**解決方法:**
```bash
rm Gemfile.lock
bundle install
```

---

## Bundler の便利なコマンド

```bash
# インストール済みのジェム一覧
bundle list

# 特定のジェムの情報
bundle info <gem-name>

# 古くなったジェムを確認
bundle outdated

# ジェムを更新
bundle update <gem-name>

# すべてのジェムを更新
bundle update

# Gemfile.lock を削除して再インストール
rm Gemfile.lock && bundle install
```

---

## レビューの依頼方法

演習を完了したら、以下のように Claude に依頼してください：

```
Bundler 演習を完了しました。Gemfile と bundler_output.txt をレビューしてください。
```
