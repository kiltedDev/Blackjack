require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "dealer"

class Game
  attr_reader :point

  def initialize
    @dealer = Dealer.new
    @deck = @dealer.deck
    @action = ""
    @player = @dealer.player
    @house = @dealer.house
    @point = 1
  end

  def ask_player
    puts "What would you like to do?"
    print "Hit or Stand? (H or S)>  "
    @action = gets.chomp.downcase
  end

  def dealer_response
    if @action == "s" || @action == "stand"
      puts "Player stands with a #{@player.score}."
    elsif @action == "h" || @action == "hit" || @action == "hit me"
      puts "Player takes another card."
      @player.hit(@deck)
    end
  end

  def player_turn
    while @action != "s" && @action != "stand" && @player.busted != true
      puts @dealer.status
      self.ask_player
      self.dealer_response
    end

    if @player.busted == true
      puts @dealer.status
      @point -= 1
    end
  end

  def dealer_turn
    if @player.busted == false
      until @house.score > 17
        @house.hit(@deck)
        if @house.busted
          puts "House has busted.  Player wins."
        end
      end
    end
  end

  def evaluate
    if @player.busted == false && @player.score > @house.score
      puts "\n#{@player.score} to my #{@house.score} Victory."
    elsif @player.busted == false && @house.busted == false
      puts "\nApologies, my #{@house.score} beats your #{@player.score}"
      @point -= 1
    end
  end

  def play
    player_turn
    dealer_turn
    evaluate
  end
end

continue = "y"
victories = 0
games = 0

while continue == "y"
  blackjack = Game.new
  blackjack.play
  victories += blackjack.point
  games += 1
  puts "\nWould you like to play again?"
  print "[Y/N] > "
  continue = gets.chomp.downcase
end

puts "\nYou won #{victories} out of #{games} hands."
if victories >= 1
  puts "\nWell done!"
end
