#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

# 教材の exercises/ ディレクトリを自動生成するスクリプト
#
# 使用方法:
#   ruby scripts/generate_exercises.rb curriculum/phase_01/day_003
#   ruby scripts/generate_exercises.rb --all-phase1

class ExerciseGenerator
  def initialize(day_path)
    @day_path = day_path
    @exercises_dir = File.join(day_path, 'exercises')
    @solutions_dir = File.join(day_path, 'solutions')
    @exercises_md = File.join(day_path, 'exercises.md')
    @readme_md = File.join(day_path, 'README.md')
  end

  def generate
    puts "📚 #{File.basename(@day_path)} の exercises/ を生成中..."

    unless Dir.exist?(@solutions_dir)
      puts "  ⚠️  solutions/ が存在しません。スキップします。"
      return
    end

    # 1. exercises/ ディレクトリを作成
    create_exercises_directory

    # 2. solutions/ から exercises/ 用のテンプレートを生成
    generate_exercise_templates

    # 3. exercises/README.md を生成
    generate_exercises_readme

    # 4. exercises.md を修正
    update_exercises_md

    # 5. README.md を修正
    update_readme_md

    puts "  ✅ 完了しました！"
  end

  private

  def create_exercises_directory
    FileUtils.mkdir_p(@exercises_dir)
    puts "  📁 exercises/ ディレクトリを作成"
  end

  def generate_exercise_templates
    solution_files = Dir.glob(File.join(@solutions_dir, 'exercise*.rb')).sort

    solution_files.each do |solution_file|
      basename = File.basename(solution_file)
      exercise_file = File.join(@exercises_dir, basename)

      # すでに存在する場合はスキップ
      if File.exist?(exercise_file)
        puts "  ⏭️  #{basename} は既に存在するためスキップ"
        next
      end

      content = File.read(solution_file)
      template = convert_to_template(content, basename)

      File.write(exercise_file, template)
      FileUtils.chmod(0755, exercise_file)
      puts "  📝 #{basename} を生成"
    end
  end

  def convert_to_template(content, filename)
    lines = content.lines
    result = []

    # shebang と frozen_string_literal を保持
    i = 0
    while i < lines.length && (lines[i].start_with?('#!') || lines[i] =~ /frozen_string_literal/)
      result << lines[i]
      i += 1
    end
    result << "\n" unless result.last == "\n"

    # コメント部分（演習の説明）を探す
    comment_section = extract_comment_section(lines, i)
    result.concat(comment_section[:lines])
    i = comment_section[:end_index]

    # TODO コメントを追加
    result << "# TODO: ここに実装してください\n"
    result << "# ヒント: 適切なヒントをここに追加してください\n"
    result << "\n\n"

    # テストコード部分を探す
    test_section = extract_test_section(lines, i)
    if test_section[:found]
      result.concat(test_section[:lines])
    else
      # テストコードがない場合は元のコードから生成
      result << "# テストコード\n"
      result << generate_basic_test(filename)
    end

    result.join
  end

  def extract_comment_section(lines, start_index)
    comment_lines = []
    i = start_index

    # コメントブロックを抽出（# で始まる行が続く限り）
    while i < lines.length
      line = lines[i]
      if line.strip.start_with?('#') || line.strip.empty?
        comment_lines << line
        i += 1
      else
        break
      end
    end

    { lines: comment_lines, end_index: i }
  end

  def extract_test_section(lines, start_index)
    test_lines = []
    found = false
    i = start_index

    # "テスト" や "if __FILE__ == $0" などを探す
    lines[i..].each_with_index do |line, index|
      if line =~ /(テスト|test|if __FILE__|puts "===)/i
        # この行以降をテストコードとして抽出
        test_lines = lines[(i + index)..]
        found = true
        break
      end
    end

    { lines: test_lines, found: found }
  end

  def generate_basic_test(filename)
    exercise_num = filename[/exercise(\d+)/, 1]
    "puts \"=== 演習#{exercise_num}: TODO ==\"\n" +
    "# テストコードをここに追加\n"
  end


  def generate_exercises_readme
    readme_file = File.join(@exercises_dir, 'README.md')

    # Day番号を抽出
    day_num = File.basename(@day_path).gsub('day_', '')

    # exercises.md を読んで演習のタイトルを抽出
    exercise_titles = extract_exercise_titles

    content = <<~MARKDOWN
      # Day #{day_num} 演習課題

      このディレクトリには、Day #{day_num} の演習課題のテンプレートファイルが含まれています。

      ## 演習の進め方

      1. **課題を読む**: `../exercises.md` で各演習の要件を確認
      2. **実装する**: 各 `exercise*.rb` ファイルの TODO 部分にコードを実装
      3. **テストする**: 各ファイルを実行して動作を確認
      4. **レビューを依頼**: 実装が完了したら Claude にレビューを依頼

      ## 演習ファイル

      #{exercise_titles.map { |t| "- `#{t[:file]}` - #{t[:title]}" }.join("\n")}

      ## 実行方法

      ```bash
      # 個別に実行
      #{exercise_titles.map { |t| "ruby #{t[:file]}" }.join("\n")}

      # すべて実行
      #{exercise_titles.map { |t| "ruby #{t[:file]}" }.join(' && ')}
      ```

      ## レビューの依頼方法

      演習を完了したら、以下のように Claude に依頼してください：

      ### パターン1: 個別の演習をレビュー

      ```
      exercise1.rb をレビューしてください
      ```

      ### パターン2: すべての演習をレビュー

      ```
      day_#{day_num}/exercises の演習をすべてレビューしてください
      ```

      ### パターン3: 特定の観点でレビュー

      ```
      exercise1.rb をレビューしてください。
      特に以下の点を確認してください：
      - コードの可読性
      - 適切なメソッドの使用
      - エッジケースの処理
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
    MARKDOWN

    File.write(readme_file, content)
    puts "  📄 exercises/README.md を生成"
  end

  def extract_exercise_titles
    return [] unless File.exist?(@exercises_md)

    content = File.read(@exercises_md)
    titles = []

    # ## 演習N: タイトル の形式を探す
    content.scan(/^##\s+演習(\d+):\s+(.+)$/) do |num, title|
      titles << { file: "exercise#{num}.rb", title: title.strip }
    end

    titles
  end

  def update_exercises_md
    return unless File.exist?(@exercises_md)

    content = File.read(@exercises_md)
    original_content = content.dup

    # solutions/exerciseN.rb → exercises/exerciseN.rb に置換
    content.gsub!(/`solutions\/(exercise\d+\.rb)`/, '`exercises/\1`')

    # 実行方法セクションを更新
    if content =~ /^##\s+実行方法.*?```bash.*?```/m
      # 既存の実行方法セクションを見つける
      content.gsub!(/^##\s+実行方法.*?```bash.*?```/m) do |match|
        # solutions への参照を追加
        if match.include?('# 解答例の確認')
          match
        else
          match.gsub(/```\s*$/, "\n# 解答例の確認（詰まったら参照）\nruby solutions/exercise1.rb\nruby solutions/exercise2.rb\n# ...\n```")
        end
      end
    end

    if content != original_content
      File.write(@exercises_md, content)
      puts "  📝 exercises.md を更新"
    end
  end

  def update_readme_md
    return unless File.exist?(@readme_md)

    content = File.read(@readme_md)
    original_content = content.dup

    # 学習の流れセクションを更新
    if content =~ /^##\s+学習の流れ/
      content.gsub!(/^##\s+学習の流れ.*?\n\n/m) do |match|
        if match.include?('Claude にレビューを依頼する')
          match
        else
          <<~FLOW
            ## 学習の流れ

            1. サンプルコード（`examples/`）を読んで実行する
            2. 解説を読んで理解を深める
            3. 演習課題（`exercises/`）に取り組む
            4. Claude にレビューを依頼する
            5. 解答例（`solutions/`）と比較する

          FLOW
        end
      end
    end

    # ファイル構成セクションを更新
    if content =~ /^##\s+ファイル構成.*?```.*?```/m
      content.gsub!(/^##\s+ファイル構成.*?```.*?```/m) do |match|
        if match.include?('exercises/')
          match
        else
          day_name = File.basename(@day_path)
          <<~STRUCTURE
            ## ファイル構成

            ```
            #{day_name}/
            ├── README.md              # このファイル
            ├── examples/              # サンプルコード
            │   └── ...
            ├── exercises.md           # 演習課題の説明
            ├── exercises/             # 演習課題（あなたが実装する）
            │   ├── README.md
            │   ├── exercise1.rb
            │   └── ...
            └── solutions/             # 解答例（詰まったら参照）
                ├── exercise1.rb
                └── ...
            ```
          STRUCTURE
        end
      end
    end

    if content != original_content
      File.write(@readme_md, content)
      puts "  📝 README.md を更新"
    end
  end
end

# メイン処理
if ARGV.empty?
  puts "使用方法:"
  puts "  ruby scripts/generate_exercises.rb curriculum/phase_01/day_003"
  puts "  ruby scripts/generate_exercises.rb --all-phase1"
  exit 1
end

if ARGV[0] == '--all-phase1'
  base_dir = File.join(__dir__, '..', 'curriculum', 'phase_01')
  day_dirs = Dir.glob(File.join(base_dir, 'day_*')).select { |d| File.directory?(d) }.sort

  day_dirs.each do |day_dir|
    generator = ExerciseGenerator.new(day_dir)
    generator.generate
    puts
  end
else
  day_path = ARGV[0]
  unless Dir.exist?(day_path)
    puts "エラー: ディレクトリが存在しません: #{day_path}"
    exit 1
  end

  generator = ExerciseGenerator.new(day_path)
  generator.generate
end

puts "\n🎉 すべての処理が完了しました！"
