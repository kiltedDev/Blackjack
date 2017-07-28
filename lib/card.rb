require "colorize"

class Card
  attr_reader :value, :suit

  def initialize (value, suit)
    @value = value
    @suit = suit
  end

  def type
    if value.to_i != 0
      @type = "Numeral"
    elsif @value != "A"
      @type = "Face Card"
    else
      @type = "Ace"
    end
  end

  def worth
    if self.type == "Numeral"
      @value.to_i
    elsif self.type == "Face Card"
      10
    else
      11
    end
  end

  def summary
    card_face = "#{value} of #{suit}s"

    if @suit == "♥" || @suit == "♦"
      card_face = card_face.colorize(:red)
    elsif @suit == "♣" || @suit == "♠"
      card_face = card_face.colorize(:light_black)
    end

    card_face
  end
end


["♠", "♥", "♦", "♣"]
