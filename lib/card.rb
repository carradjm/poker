# coding: utf-8

class Card

  SUIT_STRINGS = {
    :clubs    => "clubs",
    :diamonds => "diamonds",
    :hearts   => "hearts",
    :spades   => "spades"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  HIGHCARD_VALUE = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace => 14
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = VALUE_STRINGS[value], SUIT_STRINGS[suit]
  end

  def find_highcard_value(value)
    HIGHCARD_VALUE[value]
  end

end