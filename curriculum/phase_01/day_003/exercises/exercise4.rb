#!/usr/bin/env ruby
# Day 3: Exercise 4 - 継承を使ったゲームキャラクター

class Character
  attr_accessor :name, :hp, :mp

  def initialize(name, hp, mp)
    @name = name
    @hp = hp
    @mp = mp
  end

  def attack
    raise "子クラスで実装してください"
  end

  def take_damage(damage)
    @hp -= damage
    puts "#{@name}は#{damage}ダメージを受けた（HP: #{@hp}）"
  end

  def status
    puts "名前: #{@name}, HP: #{@hp}, MP: #{@mp}"
  end
end

# TODO: ここにWarriorクラスを実装してください



# TODO: ここにMageクラスを実装してください



# TODO: ここにHealerクラスを実装してください



# テスト
if __FILE__ == $0
  warrior = Warrior.new("太郎", 100, 20)
  mage = Mage.new("花子", 80, 50)
  healer = Healer.new("次郎", 70, 40)

  puts "--- ステータス ---"
  warrior.status
  mage.status
  healer.status

  puts "\n--- 攻撃 ---"
  puts "Warrior の攻撃: #{warrior.attack} ダメージ"
  warrior.status

  puts "\nMage の攻撃: #{mage.attack} ダメージ"
  mage.status

  puts "\nHealer の攻撃: #{healer.attack} ダメージ"
  healer.status

  puts "\n--- ダメージを受ける ---"
  warrior.take_damage(20)
  mage.take_damage(15)

  puts "\n--- ステータス確認 ---"
  warrior.status
  mage.status
end
