class Deck
  def initialize
    @cards = []
  end

  def create
    mark = ["ハート","クラブ","ダイヤ","スペード"]
    number = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    mark.each do |mark|
        number.each do |number|
            card = Card.new(mark,number)
            @cards << card
        end
    end
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end
