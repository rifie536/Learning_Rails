#!/usr/bin/env ruby
# frozen_string_literal: true

# 環境確認スクリプト
# このスクリプトを実行して開発環境が正しくセットアップされているか確認します

class EnvironmentChecker
  def initialize
    @errors = []
    @warnings = []
  end

  def run
    puts "=" * 60
    puts "Rails開発環境チェック"
    puts "=" * 60
    puts

    check_ruby_version
    check_gem_command
    check_bundler
    check_rails
    check_git
    check_postgresql

    print_results
  end

  private

  def check_ruby_version
    print "Ruby バージョン確認... "
    version = `ruby -v`.strip

    if version.include?("ruby 3.")
      puts "✓ OK"
      puts "  #{version}"
    else
      puts "✗ NG"
      @errors << "Ruby 3.x が必要です。現在: #{version}"
    end
  rescue => e
    puts "✗ NG"
    @errors << "Rubyが見つかりません: #{e.message}"
  end

  def check_gem_command
    print "gem コマンド確認... "
    version = `gem -v`.strip

    if version.length > 0
      puts "✓ OK"
      puts "  gem #{version}"
    else
      puts "✗ NG"
      @errors << "gemコマンドが使用できません"
    end
  rescue => e
    puts "✗ NG"
    @errors << "gemコマンドエラー: #{e.message}"
  end

  def check_bundler
    print "Bundler 確認... "
    version = `bundle -v`.strip

    if version.match?(/^\d+\.\d+/) || version.include?("Bundler")
      puts "✓ OK"
      puts "  Bundler version #{version}"
    else
      puts "✗ NG"
      @errors << "Bundlerがインストールされていません"
    end
  rescue => e
    puts "✗ NG"
    @errors << "Bundlerエラー: #{e.message}"
  end

  def check_rails
    print "Rails 確認... "
    version = `rails -v`.strip

    if version.include?("Rails")
      puts "✓ OK"
      puts "  #{version}"

      if version.include?("Rails 8")
        # OK
      else
        @warnings << "Rails 8.x の使用を推奨します。現在: #{version}"
      end
    else
      puts "✗ NG"
      @errors << "Railsがインストールされていません"
    end
  rescue => e
    puts "✗ NG"
    @errors << "Railsエラー: #{e.message}"
  end

  def check_git
    print "Git 確認... "
    version = `git --version`.strip

    if version.include?("git version")
      puts "✓ OK"
      puts "  #{version}"

      # Git設定確認
      name = `git config user.name`.strip
      email = `git config user.email`.strip

      if name.empty? || email.empty?
        @warnings << "Git設定が不完全です。user.nameとuser.emailを設定してください"
      end
    else
      puts "✗ NG"
      @errors << "Gitがインストールされていません"
    end
  rescue => e
    puts "✗ NG"
    @errors << "Gitエラー: #{e.message}"
  end

  def check_postgresql
    print "PostgreSQL 確認... "
    version = `psql --version`.strip

    if version.include?("psql")
      puts "✓ OK"
      puts "  #{version}"
    else
      puts "⚠ Warning"
      @warnings << "PostgreSQLがインストールされていません（後で必要になります）"
    end
  rescue => e
    puts "⚠ Warning"
    @warnings << "PostgreSQL未インストール: #{e.message}"
  end

  def print_results
    puts
    puts "=" * 60
    puts "チェック結果"
    puts "=" * 60

    if @errors.empty? && @warnings.empty?
      puts "✓ すべてのチェックに合格しました！"
      puts "  Rails開発を始める準備ができています。"
    else
      if @errors.any?
        puts
        puts "【エラー】"
        @errors.each do |error|
          puts "  ✗ #{error}"
        end
      end

      if @warnings.any?
        puts
        puts "【警告】"
        @warnings.each do |warning|
          puts "  ⚠ #{warning}"
        end
      end

      if @errors.any?
        puts
        puts "エラーを解決してから再度実行してください。"
        exit 1
      end
    end

    puts
  end
end

# スクリプト実行
checker = EnvironmentChecker.new
checker.run
