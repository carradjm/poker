require_relative "card.rb"

class Deck

  attr_reader :cards

  def initialize
    @cards = Deck.build_deck
  end

  def self.build_deck
    deck = []
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::VALUE_STRINGS.keys.each do |value|
        deck << Card.new(value, suit)
      end
    end

    deck
  end

  def shuffle
    @cards.shuffle
  end

  def deal(n = 5)
    n == 1 ?  [@cards.shift]: @cards.shift(n)
  end

  def return_cards(cards)
    @cards.concat(cards)
  end

end