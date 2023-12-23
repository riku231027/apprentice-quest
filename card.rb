class Card
  attr_reader :mark, :number

  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  def cards
    "#{@mark}の#{@number}"
  end

  def total
    case @number
    when "A" then 11
    when "J", "Q", "K" then 10
    else @number.to_i
    end
  end
end
