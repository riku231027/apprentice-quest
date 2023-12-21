class Deck
  def initialize
  end

  def deck
    ["ハート", "ダイヤ", "クラブ", "スペード",].product([
      "A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"
    ]).shuffle
  end

  def draw
    deck.pop
  end
end

# deck = Deck.new
# puts deck.draw
