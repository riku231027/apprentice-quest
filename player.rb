class User
  attr_accessor :name, :total_score

  def initialize(name) #手札を初期化
    @hands = []
    @name = name
    @ace = 0
  end

  def first_draw(deck) #最初に引くカード
    2.times do
      deck.create
      card = deck.draw
      @hands << card
    end
  end

  def total_score #トータルスコアの計算
    @total_score = 0
    @hands.each do |hand|
      @total_score += hand.total
      @ace += 1 if hand.number == "A"
    end
    if @total_score > 21 #スコアが21以上なら@ace分スコアから10を引く
      @ace.times { @total_score-= 10 }
      @ace -= 1
    end
    return @total_score
  end

  def draw(deck) #ドローして手札に入れる
    deck.create
    card = deck.draw
    @hands << card #<<は文字列の連結
    show_card
  end

  def show_hand #得点の表示
    puts "#{@name}の得点は#{@total_score}です。"
  end

  def show_card #引いたカードの表示
    puts "#{@name}の引いたカードは#{@hands.last.cards}です。"
  end
end

class Player < User
  def initialize #親クラスのinitializeを持ってくる
    super("あなた")
  end

  def player_first_draw(draw) #プレイヤーが最初に引くカード
    first_draw(draw)

    puts "#{@name}の引いた1枚目のカードは#{@hands[0].cards}でした。"
    puts "#{@name}の引いた2枚目のカードは#{@hands[1].cards}でした。"
  end
end

class Dealer < User
  def initialize
    super("ディーラー")
    @n = 1
  end

  def dealer_first_draw(draw) #ディーラーが最初に引くカード
    first_draw(draw)
    @n += 1

    puts "#{@name}の引いたカードは#{@hands[0].cards}でした。"
    puts "#{@name}の引いた2枚目のカードはわかりません。"
  end

  def dealer_second_hand_show #ディーラーの二枚目のカードを開示する。
    puts "#{@name}の引いた2枚目のカードは#{@hands[1].cards}でした。"
    puts "#{@name}の現在の得点は#{total_score}です。"
  end
end
