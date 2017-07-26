require 'pry'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def score
    total = 0
    ace_count = 0

    @cards.each do |card|
      total += card.worth
      if card.value == "A"
        ace_count += 1
      end
    end

    while total > 21 && ace_count > 0
      total -= 10
      ace_count -= 1
    end

    total
  end

  def busted
    if self.score > 21
      return true
    else
      return false
    end
  end

  def hit (deck)
    @cards << deck.collection.pop
  end
end
