require "./deck.rb"
require "./card.rb"
require "./player.rb"

class Game
  def start
    puts "ブラックジャックゲームを始めます。"

    @deck = Deck.new
    player = Player.new
    dealer = Dealer.new

    player.player_first_draw(@deck) #手札を配る
    dealer.dealer_first_draw(@deck)

    player_turn(player, dealer)

    puts "ブラックジャックゲームを終了します。"
  end

    #playerのターン
    def player_turn(player, dealer)
      if player.total_score <= 21
        puts "#{player.name}の現在の得点は#{player.total_score}です。カードを引きますか？（Y/N）"
        selected = gets.chomp.upcase
        if selected == "Y"
          player.draw(@deck)
          # player.show_card
          player_turn(player, dealer)
        elsif selected == "N"
          dealer.dealer_second_hand_show
          dealer_turn(player, dealer)
        else
          "半角でYかNを選択してください。"
          player_turn(player, dealer)
        end
      elsif player.total_score > 21
        puts "#{player.name}は得点が#{player.total_score}でバーストしました。"
        puts "#{dealer.name}の勝ちです！"
      end
    end

    def dealer_turn(player, dealer)
      if dealer.total_score < 17
        dealer.draw(@deck)
        # dealer.show_hand
        dealer_turn(player, dealer)
      elsif dealer.total_score > 21
        puts "#{dealer.name}は得点が#{dealer.total_score}でバーストしました。"
        puts "#{player.name}の勝ちです！"
      else
        result(player, dealer)
      end
    end

    def result(player, dealer)
      player_score = player.total_score
      dealer_score = dealer.total_score

      puts "#{player.name}の得点は#{player_score}です。"
      puts "#{dealer.name}の得点は#{dealer_score}です。"
      if player_score > dealer_score
        puts "#{player.name}の勝ちです！"
      elsif player_score < dealer_score
        puts "#{dealer.name}の勝ちです！"
      else
        puts "引き分けです。"
      end
    end
end
