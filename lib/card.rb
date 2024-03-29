# coding: utf-8

class Card

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUES = {
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
    :ace   => 14
  }

  FACE_CARDS = {
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace => "A"
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = VALUES[value], SUIT_STRINGS[suit]
  end
end