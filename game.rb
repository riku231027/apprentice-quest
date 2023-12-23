require "./deck.rb"
require "./card.rb"
require "./player.rb"

class Game
  def start #このメソッドを呼び出すとゲームスタート
    puts "ブラックジャックゲームを始めます。"

    @deck = Deck.new
    player = Player.new
    dealer = Dealer.new

    player.player_first_draw(@deck) #手札を配る
    dealer.dealer_first_draw(@deck)

    player_turn(player, dealer) #プレイヤーのターン

    puts "ブラックジャックゲームを終了します。"
  end

    #playerのターン
    def player_turn(player, dealer) #21以下ならhitするかどうか選ぶ21以上ならバースト
      if player.total_score <= 21
        puts "#{player.name}の現在の得点は#{player.total_score}です。カードを引きますか？（Y/N）"
        selected = gets.chomp.upcase
        if selected == "Y" #ドローして繰り返す
          player.draw(@deck)
          player_turn(player, dealer)
        elsif selected == "N" #ディーラーのターンにする
          dealer.dealer_second_hand_show
          dealer_turn(player, dealer)
        else #YかN以外を選ぶと出てくる
          "半角でYかNを選択してください。"
          player_turn(player, dealer)
        end
      elsif player.total_score > 21
        puts "#{player.name}は得点が#{player.total_score}でバーストしました。"
        puts "#{dealer.name}の勝ちです！"
      end
    end

    def dealer_turn(player, dealer)
      if dealer.total_score < 17 #17以下ならドローする17以上ならresultメソッドを呼ぶ
        dealer.draw(@deck)
        # dealer.show_hand
        dealer_turn(player, dealer)
      elsif dealer.total_score > 21 #21以上はバーストする
        puts "#{dealer.name}は得点が#{dealer.total_score}でバーストしました。"
        puts "#{player.name}の勝ちです！"
      else
        result(player, dealer)
      end
    end

    def result(player, dealer) #結果発表
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
