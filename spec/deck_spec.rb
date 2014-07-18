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
    hand = deck.cards.first(5)
    expect(deck.deal).to eq (hand)
  end

  it "Should be able to return 1 card to the deck" do
    card = deck.deal(1)
    deck.return_cards([card])
    expect(deck.cards.last).to eq(card)
  end

  it "Should be able to return multiple cards to the deck" do
    hand = deck.deal(3)
    deck.return_cards(hand)
    expect(deck.cards.last(3)).to eq(hand)
  end



end