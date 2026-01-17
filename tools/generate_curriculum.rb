#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

# カリキュラム生成ツール
class CurriculumGenerator
  PLAN_FILE = '/Users/ricefield/dev/Learning_Rails/rails_100days_plan.md'
  CURRICULUM_DIR = '/Users/ricefield/dev/Learning_Rails/curriculum'

  def initialize
    @plan_data = parse_plan
  end

  # 学習プランを解析
  def parse_plan
    content = File.read(PLAN_FILE)
    phases = {}
    current_phase = nil
    current_phase_days = []

    content.each_line do |line|
      # Phase見出しを検出
      if line.match(/^## Phase (\d+): (.+) \(Day (\d+)-(\d+)\)/)
        # 前のPhaseを保存
        phases[current_phase[:number]] = current_phase if current_phase

        # 新しいPhase開始
        phase_num = $1.to_i
        phase_name = $2.strip
        day_start = $3.to_i
        day_end = $4.to_i

        current_phase = {
          number: phase_num,
          name: phase_name,
          day_start: day_start,
          day_end: day_end,
          days: []
        }
      # Day行を検出（表形式）
      elsif line.match(/^\| (\d+) \| (.+?) \| (.+?) \|/)
        day_num = $1.to_i
        topic = $2.strip
        content = $3.strip

        if current_phase
          current_phase[:days] << {
            day: day_num,
            topic: topic,
            content: content
          }
        end
      end
    end

    # 最後のPhaseを保存
    phases[current_phase[:number]] = current_phase if current_phase

    phases
  end

  # 指定された日の教材を生成
  def generate_day(day_number)
    day_info = find_day_info(day_number)
    unless day_info
      puts "エラー: Day #{day_number} の情報が見つかりません"
      return false
    end

    phase_num = day_info[:phase]
    phase_dir = format('%02d', phase_num)
    day_dir = format('%03d', day_number)

    base_path = File.join(CURRICULUM_DIR, "phase_#{phase_dir}", "day_#{day_dir}")
    FileUtils.mkdir_p(base_path)
    FileUtils.mkdir_p(File.join(base_path, 'examples'))
    FileUtils.mkdir_p(File.join(base_path, 'solutions'))

    # ファイル生成
    generate_readme(base_path, day_info)
    generate_examples(base_path, day_info)
    generate_exercises(base_path, day_info)
    generate_solutions(base_path, day_info)

    puts "✓ Day #{day_number} の教材を生成しました: #{base_path}"
    true
  end

  # 複数の日を一括生成
  def generate_range(start_day, end_day)
    (start_day..end_day).each do |day|
      generate_day(day)
    end
  end

  # Phase全体を生成
  def generate_phase(phase_number)
    phase = @plan_data[phase_number]
    unless phase
      puts "エラー: Phase #{phase_number} が見つかりません"
      return false
    end

    puts "Phase #{phase_number}: #{phase[:name]} の教材を生成中..."
    generate_range(phase[:day_start], phase[:day_end])
    puts "✓ Phase #{phase_number} 完了"
    true
  end

  private

  def find_day_info(day_number)
    @plan_data.each do |phase_num, phase|
      day_data = phase[:days].find { |d| d[:day] == day_number }
      if day_data
        return {
          phase: phase_num,
          phase_name: phase[:name],
          day: day_number,
          topic: day_data[:topic],
          content: day_data[:content]
        }
      end
    end
    nil
  end

  def generate_readme(base_path, day_info)
    content = <<~README
      # Day #{day_info[:day]}: #{day_info[:topic]}

      ## 学習目標

      - #{day_info[:content]}を理解する
      - 実践的なコード例を通じて学ぶ
      - 演習を通じて理解を深める

      ## 今日学ぶこと

      ### 概要

      #{day_info[:topic]}について学びます。

      **Railsでの重要性:**
      この知識はRailsアプリケーション開発において重要です。

      ## 学習の流れ

      1. サンプルコード（`examples/`）を読んで実行する
      2. 解説を読んで理解を深める
      3. 演習課題（`exercises.md`）に取り組む
      4. 解答例（`solutions/`）と比較する

      ## ファイル構成

      ```
      day_#{format('%03d', day_info[:day])}/
      ├── README.md              # このファイル
      ├── examples/              # サンプルコード
      ├── exercises.md           # 演習課題
      └── solutions/             # 解答例
      ```

      ## 所要時間

      - サンプルコード実行・理解: 60分
      - 演習課題: 30-45分
      - **合計: 約1.5-2時間**

      ## 参考リンク

      - [Railsガイド](https://railsguides.jp/)

      ## 次のステップ

      Day #{day_info[:day] + 1}に進みましょう。
    README

    File.write(File.join(base_path, 'README.md'), content)
  end

  def generate_examples(base_path, day_info)
    examples_dir = File.join(base_path, 'examples')

    # 基本的な例を1つ生成
    content = <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      # =========================================
      # #{day_info[:topic]} - サンプルコード
      # =========================================

      puts "=" * 60
      puts "#{day_info[:topic]}"
      puts "=" * 60

      # ここにサンプルコードを追加してください

      puts "\\nこのサンプルは Day #{day_info[:day]} の学習内容です。"
      puts "詳細は README.md と演習課題を参照してください。"
    RUBY

    File.write(File.join(examples_dir, '01_example.rb'), content)
    FileUtils.chmod(0755, File.join(examples_dir, '01_example.rb'))
  end

  def generate_exercises(base_path, day_info)
    content = <<~EXERCISES
      # Day #{day_info[:day]}: 演習課題

      ## 演習1: 基礎的な理解

      #{day_info[:topic]}について、基本的な実装を行ってください。

      **要件:**
      - #{day_info[:content]}
      - 適切なメソッド名を使用する
      - コメントで説明を追加する

      **使用例:**
      ```ruby
      # コード例をここに記述
      ```

      `solutions/exercise1.rb`に実装してください。

      ---

      ## 演習2: 応用問題

      より実践的な課題に取り組んでください。

      **要件:**
      - 演習1の知識を応用する
      - エラーハンドリングを含める
      - テストケースを考える

      `solutions/exercise2.rb`に実装してください。

      ---

      ## チェックリスト

      すべての演習を完了したら、以下を確認してください：

      - [ ] 演習1が動作する
      - [ ] 演習2が動作する
      - [ ] コードにコメントを追加した
      - [ ] エッジケースを考慮した

      ## 実行方法

      ```bash
      # サンプルコードの実行
      ruby examples/01_example.rb

      # 演習の実行
      ruby solutions/exercise1.rb
      ruby solutions/exercise2.rb
      ```

      ## 完了後

      Day #{day_info[:day] + 1}に進みましょう！
    EXERCISES

    File.write(File.join(base_path, 'exercises.md'), content)
  end

  def generate_solutions(base_path, day_info)
    solutions_dir = File.join(base_path, 'solutions')

    # 演習1の解答テンプレート
    content1 = <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      # 演習1: #{day_info[:topic]}

      # ここに解答コードを記述してください

      puts "=== 演習1: #{day_info[:topic]} ==="
      # 実装コード

      puts "\\n演習1を完了しました。"
    RUBY

    File.write(File.join(solutions_dir, 'exercise1.rb'), content1)
    FileUtils.chmod(0755, File.join(solutions_dir, 'exercise1.rb'))

    # 演習2の解答テンプレート
    content2 = <<~RUBY
      #!/usr/bin/env ruby
      # frozen_string_literal: true

      # 演習2: #{day_info[:topic]} - 応用

      # ここに解答コードを記述してください

      puts "=== 演習2: #{day_info[:topic]} - 応用 ==="
      # 実装コード

      puts "\\n演習2を完了しました。"
    RUBY

    File.write(File.join(solutions_dir, 'exercise2.rb'), content2)
    FileUtils.chmod(0755, File.join(solutions_dir, 'exercise2.rb'))
  end
end

# CLIインターフェース
if __FILE__ == $PROGRAM_NAME
  generator = CurriculumGenerator.new

  if ARGV.empty?
    puts "カリキュラム生成ツール"
    puts ""
    puts "使い方:"
    puts "  #{$PROGRAM_NAME} day <日数>              # 特定の日を生成"
    puts "  #{$PROGRAM_NAME} range <開始> <終了>     # 範囲を生成"
    puts "  #{$PROGRAM_NAME} phase <Phase番号>       # Phase全体を生成"
    puts "  #{$PROGRAM_NAME} all                     # 全て生成（Day 1-140）"
    puts ""
    puts "例:"
    puts "  #{$PROGRAM_NAME} day 10"
    puts "  #{$PROGRAM_NAME} range 6 25"
    puts "  #{$PROGRAM_NAME} phase 2"
    exit 0
  end

  command = ARGV[0]

  case command
  when 'day'
    if ARGV[1]
      day = ARGV[1].to_i
      generator.generate_day(day)
    else
      puts "エラー: 日数を指定してください"
      puts "例: #{$PROGRAM_NAME} day 10"
    end

  when 'range'
    if ARGV[1] && ARGV[2]
      start_day = ARGV[1].to_i
      end_day = ARGV[2].to_i
      generator.generate_range(start_day, end_day)
    else
      puts "エラー: 開始日と終了日を指定してください"
      puts "例: #{$PROGRAM_NAME} range 6 25"
    end

  when 'phase'
    if ARGV[1]
      phase = ARGV[1].to_i
      generator.generate_phase(phase)
    else
      puts "エラー: Phase番号を指定してください"
      puts "例: #{$PROGRAM_NAME} phase 2"
    end

  when 'all'
    puts "全ての教材（Day 1-140）を生成します..."
    generator.generate_range(1, 140)
    puts "✓ 完了しました"

  else
    puts "エラー: 不明なコマンド '#{command}'"
    puts "使い方: #{$PROGRAM_NAME} [day|range|phase|all]"
  end
end
