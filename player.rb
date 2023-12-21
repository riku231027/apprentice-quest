require_relative "card"
require_relative "deck"
require_relative "game"

class Player
  attr_reader :name, :total

  def initialize(name)
    @name = name
    @total = 0
    @card = Card.new
    @deck = Deck.new
    @game = Game.new
  end

  def selection
    if @total <= 21
      puts "#{@name}の現在の得点は#{@total}です。カードを引きますか？（Y/N）"
      hit = gets.chomp.upcase
      case hit
      when "Y"
        draw
        selection
      when "N"
        Dealer.new.hit
      else
        puts "YかNを入力してください"
        selection
      end
    elsif @total > 21
      puts "#{@name}の得点は#{@total}でバーストしました。"
      puts "ディーラーの勝ちです"
    else
      puts "error"
    end
  end

  def draw
    @new_card = @deck.draw
    @total += @card.points(@new_card)
    show_card
  end

  def show_card
    puts "#{@name}の引いたカードは#{@new_card[0]}の#{@new_card[1]}です。"
  end
end

class Dealer < Player
  def initialize
    super("ディーラー")
    @N = 2
  end

  def draw_dealer
    @new_card = @deck.draw
    @total += @card.points(@new_card)
    puts "#{@name}の引いた#{@N}枚目のカードは#{@new_card[0]}の#{@new_card[1]}でした。"
  end

  def hit
    draw_dealer
    if @total <= 17
      @N += 1
      draw_dealer
    elsif @total > 21
      puts "#{@name}はバーストしました。"
      puts "#{@player.name}の勝ちです！"
    # else
    #   @game.result
    end
  end

  def second_card
    puts "#{@name}の引いた2枚目のカードはわかりません"
  end
end


# player = Player.new("あなた")
# puts player.draw
