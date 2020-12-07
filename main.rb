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
while initialDeal < 1 || (initialDeal * numPlayers) > 52 do
  puts "Cannot deal fewer than 1 card or more cards than in deck, please input a new number or \"-1\" to quit"
  initialDeal = gets.to_i
  if initialDeal == -1
    exit(0)
  end
end

game.deal(initialDeal)

gameOn = 1
turnCounter = 0

while gameOn == 1 do
  puts "It's #{@players[turnCounter % numPlayers].name}'s turn"
  action = 0
  while action == 0
    puts "Please choose an action"
    puts "\"0\" to view your hand (will not advance turn)"
    puts "\"-1\" to quit the game"
    action = gets.to_i
    case action
    when 0
      game.display_hand(@players[turnCounter % numPlayers].name)
    when -1
      exit(0)
    end
  end
  gameOn = 0
end

game.display_hand('kelton')
