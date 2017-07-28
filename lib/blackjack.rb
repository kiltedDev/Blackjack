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
    puts "What would you like to do?".colorize(:light_blue)
    print "  Hit or Stand?>  ".colorize(:light_blue)
    @action = gets.chomp.downcase.split("")[0]
  end

  def dealer_response
    if @action == "s"
      puts "Player stands with a #{@player.score}."
    elsif @action == "h"
      puts "Player takes another card."
      @player.hit(@deck)
    end
  end

  def player_turn
    while @action != "s" && !@player.busted? && !@player.blackjack?
      puts @dealer.status
      self.ask_player
      self.dealer_response
    end

    if @player.blackjack?
      puts "Blackjack!  You Win!"
    end

    if @player.busted?
      @point -= 1
    end
  end

  def dealer_turn
    if !@player.busted? && !@player.blackjack?
      until @house.score > 17
        @house.hit(@deck)
        if @house.busted?
          puts "House has busted.  Player wins."
        end
      end
    end
  end

  def evaluate
    if !@player.busted?  && @player.score > @house.score
      puts "\n#{@player.score} to my #{@house.score} Victory."
    elsif !@player.busted? && !@house.busted?
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
  puts "\nWould you like to play again?".colorize(:light_blue)
  print "  [Y/N] > ".colorize(:light_blue)
  continue = gets.chomp.downcase.split("")[0]
end

puts "\nYou won #{victories} out of #{games} hands."
if victories >= 1
  puts "\nWell done!"
end
