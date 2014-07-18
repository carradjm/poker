require "rspec"
require "deck"

describe Deck do

  subject(:deck) { Deck.new }

  it "Should have 52 cards" do
    expect(deck.cards.count).to eq(52)
  end

  it "Should be shuffled" do
    shuffle_deck = deck.shuffle
    expect(shuffle_deck[0..10]).to_not eq(deck.cards[0..10])
  end

  it "Should deal cards" do
    hand = deck.cards.last(5)
    expect(deck.deal).to eq (hand)
  end

  it "Should be able to return cards to the deck" do
    card = deck.cards.pop
    deck.return_card(card)
    expect(deck.cards.first).to eq(card)
  end



end