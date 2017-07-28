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

  def blackjack?
    blackjack_score = 0
    if @cards[0].type == "Ace" || @cards[1].type == "Ace"
      blackjack_score +=1
    end

    if @cards[0].type == "Face Card" || @cards[1].type == "Face Card"
      blackjack_score += 1
    end

    blackjack_score == 2
  end

  def busted?
    self.score > 21
  end

  def hit (deck)
    @cards << deck.collection.pop
  end
end
