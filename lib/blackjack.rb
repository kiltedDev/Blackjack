require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "table"

table = Table.new

action = "learn"
player = table.player
dealer = table.dealer

while action != "s" && action != "stand" && player.busted != true
  puts table.status

  puts "What would you like to do?"
  print "Hit or Stand? (H or S)>"
  action = gets.chomp.downcase

  if action == "s" || action == "stand"
    puts "Player stands."
  elsif action == "h" || action == "hit" || action == "hit me"
    puts "Player takes another card."
    player.hit(table.deck)
  end
end

if player.busted == true
  puts table.status
end

until dealer.score > 17
  dealer.hit(table.deck)
  if dealer.busted
    puts "House has busted.  Player wins."
  end
end

if player.busted == false && player.score > dealer.score
  puts "#{player.score} to my #{dealer.score} Victory."
elsif player.busted == false && dealer.busted == false
  puts "Apologies, my #{dealer.score} beats your #{player.score}"
end
