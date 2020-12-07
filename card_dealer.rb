require_relative 'deck'

class Card_Dealer

  attr_reader :deck

  def initialize(deck, players)
    @deck = deck
    @players = players
  end 

  def deal(cards)
    @players.each do |player|
      for i in 0...cards
        player.hand[i] = @deck.pop()
      end
      #print player.hand
    end
  end
    
  def display_hand(name)
    @players.each do |player|
      if player.name == name
        puts "#{player.name}'s hand"
        print player.hand
        puts
      end
    end
  end
  
  def draw(name)
    @players.each do |player|
      if player.name == name
        player.hand << @deck.pop()
      end
    end
  end

  def play(name, i)
    @players.each do |player|
      if player.name == name
      print "Playing card: "
      print player.hand[i]
      puts
      player.hand.delete_at(i)
      end
    end
  end
end
