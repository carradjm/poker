require_relative 'deck.rb'

class Hand

  HAND_RANKING = [
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  def self.deal_from(deck)
    Hand.new(deck.deal(5))
  end

  attr_accessor :cards, :hand_ranking

  def initialize(cards)
    @cards = cards
    @hand_ranking = nil
  end

  def return_card_values
    card_values = @cards.map { |card| card.value }
  end

  def return_card_suits
    cards_suits = @cards.map { |card| card.suit }
  end

  def maybe_beat(other_hand)
    HAND_RANKING.index(other_hand.hand_ranking) <=> HAND_RANKING.index(@hand_ranking)
  end

  def rank_hand
    return @hand_ranking = :straight_flush if straight_flush?
    return @hand_ranking = :four_of_a_kind if four_of_a_kind?
    return @hand_ranking = :full_house if full_house?
    return @hand_ranking = :flush if flush?
    return @hand_ranking = :straight if straight?
    return @hand_ranking = :three_of_a_kind if three_of_a_kind?
    return @hand_ranking = :two_pair if two_pair?
    return @hand_ranking = :one_pair if one_pair?
    @hand_ranking = :high_card
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    card1 = return_card_values[0]
    card2 = return_card_values[1]
    return_card_values.count(card1) == 4 || return_card_values.count(card2) == 4
  end

  def full_house?
    return false unless return_card_values.uniq.length == 2
    true
  end

  def flush?
    @cards.all? {|card| card.suit == @cards[0].suit}
  end

  def straight?
    potential_straight = return_card_values.sort

    return true if potential_straight == [2,3,4,5,14]

    first_card_value = potential_straight[0]
    (first_card_value...first_card_value + 5).to_a == potential_straight
  end

  def three_of_a_kind?
    card1 = return_card_values[0]
    card2 = return_card_values[1]
    card3 = return_card_values[2]
    return_card_values.count(card1) == 3 ||
      return_card_values.count(card2) == 3 ||
        return_card_values.count(card3) == 3
  end

  def two_pair?
    return_card_values.uniq.count == 3
  end

  def one_pair?
    return_card_values.uniq.count ==
  end

  def high_card
    return_card_values.sort.last
  end

end

#
# def swap_cards(cards)
#   cards.each {|card| @cards.delete(card)}
#
#   new_cards = @deck.return_cards(cards)
#
#   @cards += new_cards
# end