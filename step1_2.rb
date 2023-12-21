class Blackjack
  def initialize
    @user_card_number = 0
    @cpu_card_number = 0
    @card_mark = ["クラブ", "ダイヤ", "ハート", "スペード"]
    @card_num = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
    @N = 1
    @user_ace = 0
    @cpu_ace = 0
  end

  def start_game
    puts "ブラックジャックゲームを開始します。"
    user_system
    selection
    puts "ブラックジャックを終了します。"
  end

  def test
    puts @cpu_card_number
    puts @user_card_number
  end

  private

  def user_draw(card_number)
    @user_card = card_number
    @user_ace += 1 if card_number == "A"
    user_number_check
    puts "あなたが引いたカードは#{@card_mark.sample}の#{card_number}です。"
  end

  def cpu_draw(card_number)
    @cpu_card = card_number
    @cpu_ace += 1 if card_number == "A"
    cpu_number_check
    puts "ディーラーが引いた#{@N}枚目のカードは#{@card_mark.sample}の#{card_number}でした。"
    @N += 1
  end

  def selection
    if @user_card_number <= 21
      puts "あなたの現在の得点は#{@user_card_number}です。カードを引きますか？（Y/N)"
      selected_hit = gets.chomp.upcase
      if selected_hit == "Y" && @user_card_number <= 21
        user_draw(@card_num.sample)
        selection
      elsif selected_hit == "N"
        cpu_system
      else
        puts "YかNを選択してください"
        selection
      end
    elsif @user_card_number > 21
      @user_ace.times { @user_card_number -= 10 if @user_card_number > 21}
      if @user_card_number <= 21
        selection
      else
        puts "あなたの得点は#{@user_card_number}でバーストしました。"
        puts "ディーラーの勝ちです！"
      end
    else
      puts "ERROR"
    end
  end

  def user_number_check
    user_ace = 0

    case @user_card
    when "A"
      @user_card_number += 11
    when "J", "Q", "K"
      @user_card_number += 10
    else
      @user_card_number += @user_card.to_i
    end
  end

  def cpu_number_check
    cpu_ace = 0

    case @cpu_card
    when "A"
      @cpu_card_number += 11
    when "J", "Q", "K"
      @cpu_card_number += 10
    else
      @cpu_card_number += @cpu_card.to_i
    end

    @cpu_ace.times { @cpu_card_number -= 10 if @cpu_card_number > 21}
  end

  def user_system
    2.times do
      user_draw(@card_num.sample)
    end
    cpu_draw(@card_num.sample)
    puts "ディーラーが引いた2枚目のカードはわかりません。"
  end

  def cpu_system
    cpu_draw(@card_num.sample)
    if @cpu_card_number <= 17
      cpu_system
    elsif @cpu_card_number > 21
      puts "ディーラーの得点が#{@cpu_card_number}でバーストしました"
      puts "あなたの勝ちです！"
    else
      puts "あなたの得点は#{@user_card_number}です。"
      puts "ディーラーの得点は#{@cpu_card_number}です。"
      result
    end
  end

  def result
    if @user_card_number > @cpu_card_number && @user_card_number <= 21
      puts "あなたの勝ちです！"
    elsif @user_card_number < @cpu_card_number && @cpu_card_number <= 21
      puts "ディーラーの勝ちです！"
    elsif @cpu_card_number > 21
      puts "あなたの勝ちです！"
    elsif @user_card_number > 21
      puts "ディーラーの勝ちです！"
    else
      puts "引き分けです！"
    end
  end
end


# Blackjack.new.start_game
