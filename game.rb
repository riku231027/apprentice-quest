require_relative "card"
require_relative "deck"
require_relative "player"

class Game
  def initialize
    @card = Card.new
    @player = Player.new("あなた")
    @dealer = Dealer.new
  end

  def start_game
    puts "ブラックジャックを開始します"

    2.times do
      @player.draw
    end
    @dealer.draw
    @dealer.second_card
    @player.selection

    puts "ブラックジャックを終了します。"
  end

  # def result
  #   puts "#{@player.name}の得点は#{@player.total}です"
  #   puts "#{@dealer.name}の得点は#{@dealer.total}です"
  #   if @player.total > @dealer.total
  #     puts "#{@player.name}の勝ちです！"
  #   elsif @player.total < @dealer.total
  #     puts "#{@dealer.name}の勝ちです！"
  #   end
  # end
end

game = Game.new
puts game.start_game
