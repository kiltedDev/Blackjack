class Table
  attr_reader :deck
  attr_accessor :dealer, :player

  def initialize
    @deck = Deck.new
    self.deal
  end

  def deal
    @dealer = Hand.new
    @player = Hand.new

    2.times { @player.hit(deck) }
    2.times { @dealer.hit(deck) }
  end

  def status
    table_status = "You are holding:\n"
    @player.cards.each do |card|
      table_status += "*#{card.value} of #{card.suit}s\n"
    end
    table_status += "\n"
    if player.busted
      table_status +=  "I am sorry, that's a bust.\n"
      table_status +=  "Unfortunately, you lose.\n"
    else
      table_status +=  "You currently hold a #{player.score}\n"
      table_status += "\n"
      table_status +=  "Dealer is showing a #{dealer.cards[0].value} of #{dealer.cards[1].suit}s\n"
    end
    table_status
  end
  require 'pry'
  # binding.pry
end
