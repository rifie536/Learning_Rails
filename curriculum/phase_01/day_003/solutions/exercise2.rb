#!/usr/bin/env ruby
# Day 3: Exercise 2 - Bank（銀行口座）クラス

class Bank
  attr_reader :account_number, :owner
  attr_accessor :balance

  def initialize(account_number, owner, balance)
    @account_number = account_number
    @owner = owner
    @balance = balance
  end

  def deposit(amount)
    if amount <= 0
      puts "エラー：正の金額を入金してください"
      return false
    end
    @balance += amount
    puts "入金: ¥#{amount} → 残高: ¥#{@balance}"
    true
  end

  def withdraw(amount)
    if amount <= 0
      puts "エラー：正の金額を出金してください"
      return false
    end
    if @balance < amount
      puts "エラー：残高不足です（残高: ¥#{@balance}）"
      return false
    end
    @balance -= amount
    puts "出金: ¥#{amount} → 残高: ¥#{@balance}"
    true
  end

  def info
    puts "口座番号: #{@account_number}, 名義人: #{@owner}, 残高: ¥#{@balance}"
  end
end

# テスト
if __FILE__ == $0
  account = Bank.new("12345", "太郎", 10000)
  account.info

  puts "\n--- 5000円入金 ---"
  account.deposit(5000)
  account.info

  puts "\n--- 3000円出金 ---"
  account.withdraw(3000)
  account.info

  puts "\n--- 残高を超える出金を試みる ---"
  account.withdraw(20000)

  puts "\n--- 負の金額の入金を試みる ---"
  account.deposit(-1000)
end
