require_relative 'hand.rb'

class YouArePoorError < StandardError
end


class Game

  def initialize(player1, player2)
    @player1, @player2 = Player.new("bob", 10_000), Player.new("Steve", 15_000)
    @deck = Deck.new.shuffle
  end

  def play
    puts "Dealing the cards"

    @player1.cards = Hand.deal_from(@deck)
    @player2.cards = Hand.deal_from(@deck)
  end

end


class Player

  attr_accessor :bankroll, :cards
  attr_reader :name

  def initialize(name,bankroll)
    @name = name
    @bankroll = bankroll
    @cards = nil
  end

  def bet(amt)
   raise YouArePoorError if amt > @bankroll
   @bankroll -= amt
   amt
  end

  def collect_winnings(amt)
    @bankroll += amt
  end

  def swap_cards(card_indices, deck)
    return_cards = card_indices.each { |index| @cards.delete(@cards[index]) }
    @cards += deck.return_cards(return_cards)
  end


end