require_relative "deck"
require_relative "player"

class Card
  attr_reader :card

  def points(card)
    case card[1]
    when "A" then 11
    when "J", "Q", "K" then 10
    else card[1].to_i
    end
  end
end

# cards = Card.new
# puts cards.show
