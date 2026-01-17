#!/usr/bin/env ruby
# frozen_string_literal: true

# =========================================
# イテレータの基礎
# =========================================

puts "=" * 60
puts "Rubyの主要なイテレータ"
puts "=" * 60

# サンプルデータ
numbers = [1, 2, 3, 4, 5]
users = [
  { name: "太郎", age: 25, active: true },
  { name: "花子", age: 30, active: false },
  { name: "次郎", age: 22, active: true }
]

puts "\n" + "=" * 60
puts "1. each - 各要素に対して処理を実行"
puts "=" * 60

puts "\n【例1: 基本的なeach】"
numbers.each do |num|
  puts "数値: #{num}"
end

puts "\n【例2: ハッシュのeach】"
users.each do |user|
  puts "#{user[:name]}さん（#{user[:age]}歳）"
end

puts "\n" + "=" * 60
puts "2. map (collect) - 各要素を変換した新しい配列を返す"
puts "=" * 60

puts "\n【例3: 数値を2倍に】"
doubled = numbers.map { |num| num * 2 }
puts "元の配列: #{numbers}"
puts "2倍の配列: #{doubled}"

puts "\n【例4: ユーザー名だけを取り出す】"
names = users.map { |user| user[:name] }
puts "ユーザー名: #{names.join(', ')}"

# &:method_name の省略記法
# 注: ハッシュには使えない
puts "\n【例5: シンボル to_proc】"
words = ["hello", "world"]
upcase_words = words.map(&:upcase)
puts "大文字: #{upcase_words}"

puts "\n" + "=" * 60
puts "3. select (filter) - 条件に合う要素だけを抽出"
puts "=" * 60

puts "\n【例6: 偶数だけを抽出】"
evens = numbers.select { |num| num.even? }
puts "偶数: #{evens}"

puts "\n【例7: アクティブなユーザーだけ】"
active_users = users.select { |user| user[:active] }
puts "アクティブユーザー:"
active_users.each { |u| puts "  #{u[:name]}" }

puts "\n" + "=" * 60
puts "4. reject - 条件に合わない要素を抽出"
puts "=" * 60

puts "\n【例8: 奇数を除外】"
not_odds = numbers.reject { |num| num.odd? }
puts "奇数以外: #{not_odds}"

puts "\n【例9: 非アクティブユーザーを除外】"
non_inactive = users.reject { |user| !user[:active] }
puts "非アクティブ以外:"
non_inactive.each { |u| puts "  #{u[:name]}" }

puts "\n" + "=" * 60
puts "5. find (detect) - 条件に合う最初の要素を返す"
puts "=" * 60

puts "\n【例10: 最初の偶数】"
first_even = numbers.find { |num| num.even? }
puts "最初の偶数: #{first_even}"

puts "\n【例11: 30歳以上の最初のユーザー】"
adult = users.find { |user| user[:age] >= 30 }
puts "30歳以上: #{adult[:name]}さん" if adult

puts "\n" + "=" * 60
puts "6. reduce (inject) - 要素を集約して1つの値にする"
puts "=" * 60

puts "\n【例12: 合計を計算】"
sum = numbers.reduce(0) { |total, num| total + num }
puts "合計: #{sum}"

# 簡潔な書き方
sum2 = numbers.reduce(:+)
puts "合計（簡潔版）: #{sum2}"

puts "\n【例13: 年齢の合計】"
total_age = users.reduce(0) { |sum, user| sum + user[:age] }
puts "年齢の合計: #{total_age}"

puts "\n" + "=" * 60
puts "7. any? - 条件に合う要素が1つでもあるか"
puts "=" * 60

puts "\n【例14: 偶数があるか】"
has_even = numbers.any? { |num| num.even? }
puts "偶数がある: #{has_even}"

puts "\n【例15: 非アクティブユーザーがいるか】"
has_inactive = users.any? { |user| !user[:active] }
puts "非アクティブユーザーがいる: #{has_inactive}"

puts "\n" + "=" * 60
puts "8. all? - すべての要素が条件に合うか"
puts "=" * 60

puts "\n【例16: すべて正の数か】"
all_positive = numbers.all? { |num| num > 0 }
puts "すべて正の数: #{all_positive}"

puts "\n【例17: 全員アクティブか】"
all_active = users.all? { |user| user[:active] }
puts "全員アクティブ: #{all_active}"

puts "\n" + "=" * 60
puts "9. none? - 条件に合う要素が1つもないか"
puts "=" * 60

puts "\n【例18: 負の数がないか】"
no_negative = numbers.none? { |num| num < 0 }
puts "負の数がない: #{no_negative}"

puts "\n" + "=" * 60
puts "10. count - 条件に合う要素の数"
puts "=" * 60

puts "\n【例19: 偶数の個数】"
even_count = numbers.count { |num| num.even? }
puts "偶数の個数: #{even_count}"

puts "\n【例20: アクティブユーザー数】"
active_count = users.count { |user| user[:active] }
puts "アクティブユーザー数: #{active_count}"

puts "\n" + "=" * 60
puts "11. group_by - 条件でグループ分け"
puts "=" * 60

puts "\n【例21: 偶数と奇数でグループ分け】"
grouped = numbers.group_by { |num| num.even? ? :even : :odd }
puts "偶数: #{grouped[:even]}"
puts "奇数: #{grouped[:odd]}"

puts "\n【例22: アクティブ状態でグループ分け】"
user_groups = users.group_by { |user| user[:active] }
puts "アクティブ: #{user_groups[true]&.map { |u| u[:name] }&.join(', ')}"
puts "非アクティブ: #{user_groups[false]&.map { |u| u[:name] }&.join(', ')}"

puts "\n" + "=" * 60
puts "12. メソッドチェーン"
puts "=" * 60

puts "\n【例23: 複数のイテレータを組み合わせ】"
result = numbers
  .select { |num| num.odd? }      # 奇数だけ
  .map { |num| num * 2 }           # 2倍に
  .reduce(:+)                      # 合計

puts "奇数を2倍して合計: #{result}"
puts "計算過程:"
puts "  1. #{numbers} から奇数だけ → [1, 3, 5]"
puts "  2. 各要素を2倍 → [2, 6, 10]"
puts "  3. 合計 → #{result}"

puts "\n【例24: ユーザーデータの加工】"
active_names = users
  .select { |user| user[:active] }
  .map { |user| user[:name] }
  .map(&:upcase)

puts "アクティブユーザーの名前（大文字）: #{active_names.join(', ')}"

puts "\n" + "=" * 60
puts "13. Railsでのイテレータ使用例"
puts "=" * 60

puts "\n【例25: Railsでよく使うパターン】"
puts "# ビューでのeach"
puts "<% @users.each do |user| %>"
puts "  <li><%= user.name %></li>"
puts "<% end %>"
puts ""
puts "# コントローラでのmap"
puts "@user_names = @users.map(&:name)"
puts ""
puts "# モデルでのselect"
puts "active_users = User.all.select { |u| u.active? }"
