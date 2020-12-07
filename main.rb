require_relative 'deck'
require_relative 'player'
require_relative 'card_dealer'

myDeck = Deck.new
#myDeck.display_deck()
#puts()
myDeck.shuffle()
#myDeck.display_deck()

kelton = Player.new('kelton')
players = [kelton]
game = Card_Dealer.new(myDeck, players)

game.deal(5)
game.display_hand('kelton')
