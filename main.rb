require_relative 'deck'
require_relative 'player'
require_relative 'card_dealer'

myDeck = Deck.new
myDeck.shuffle()

@players = []

puts "Thanks for using this deck of cards, please input the number of players"
numPlayers = gets.to_i
while numPlayers < 1 do
  puts "Cannot have fewer than 1 player, please input the number of players or \"-1\" to quit"
  numPlayers = gets.to_i
  if numPlayers == -1
    exit(0)
  end
end

for i in 1..numPlayers
  puts "Please input a name for player #{i}"
  player = gets.chomp
  newPlayer = Player.new(player)
  @players << newPlayer
  puts "Adding player #{player}"
end

game = Card_Dealer.new(myDeck, @players)

puts "Please input the number of cards to deal to each player"
initialDeal = gets.to_i
while initialDeal < 1 || (initialDeal * numPlayers) > myDeck.length() do
  puts "Cannot deal fewer than 1 card or more cards than in deck, please input a new number or \"-1\" to quit"
  initialDeal = gets.to_i
  if initialDeal == -1
    exit(0)
  end
end

game.deal(initialDeal)
puts 

gameOn = 1
turnCounter = 0
cardIndex = 0

while gameOn == 1 do
  puts "It's #{@players[turnCounter % numPlayers].name}'s turn"
  action = 0
  while action == 0 || action == 2 do
    puts "Please choose an action"
    puts "\"0\" to view your hand (will not advance turn)"
    puts "\"1\" to skip your turn"
    puts "\"2\" to draw a card (will not advance turn)"
    puts "\"3\" to play a card (will advance turn)"
    puts "\"-1\" to quit the game"
    action = gets.to_i

    case action
    when 0
      game.display_hand(@players[turnCounter % numPlayers].name)
    when 1
      next
    when 2
      if myDeck.length() > 0
        game.draw(@players[turnCounter % numPlayers].name)
      else
        puts "Deck is empty"
      end
    when 3
      puts "Please choose a card to play by index from 0 to #{@players[turnCounter % numPlayers].hand.length() - 1} (left to right), or -1 to view your hand"
      cardIndex = gets.to_i
      while cardIndex >= @players[turnCounter % numPlayers].hand.length() || cardIndex < 0
        if cardIndex == -1
          game.display_hand(@players[turnCounter % numPlayers].name)
          puts "Please choose a card to play by index (0 on the left, increasing by 1 to the right), or -1 to view your hand"
          cardIndex = gets.to_i
        else 
          puts "Invalid index please choose a value between -1 and #{@players[turnCounter % numPlayers].hand.length() - 1} inclusive"
          cardIndex = gets.to_i
        end
      end
      game.play(@players[turnCounter % numPlayers].name, cardIndex)
    when -1
      exit(0)
    else
      puts "Invalid option"
      action = 0
    end
  end
  turnCounter += 1
  puts "--------------------------------NEW TURN-----------------------------------------------"
end
