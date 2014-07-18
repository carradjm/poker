require 'rspec'
require 'player'


describe Player do
  let(:player) { Player.new("Bob", 10000) }

  it "initializes correctly" do
    expect(player.name).to_not be nil
    expect(player.bankroll).to_not be nil
    expect(player.cards).to be nil
  end

  describe "Player can make a bet" do

    it "subtracts the amount from the bankroll" do
      player.bet(100)

      expect(player.bankroll).to eq(9900)
    end

    it "will not allow player to bet more than they have" do
      expect { player.bet(10100) }.to raise_error
    end

    it "return the amount of the bet" do
      expect(player.bet(100)).to eq(100)
    end
  end

  describe "Play can collect winnings" do

    it "adds the amount to the bankroll" do
      player.bet(100)
      player.collect_winnings(200)
      expect(player.bankroll).to eq(10100)
    end
  end

  describe "Player can swap cards" do
    let(:deck) { Deck.new }
    let(:cards) {         [Card.new(:deuce, :hearts),
                           Card.new(:deuce, :spades),
                           Card.new(:deuce, :clubs),
                           Card.new(:seven, :hearts),
                           Card.new(:seven, :clubs)]
                }

    it "Updates the hand" do
      player.cards = cards
      old_hand = player.cards
      player.swap_cards([1,3], deck)
      expect(player.cards).to_not include(old_hand[1])
      expect(player.cards.length).to eq(5)
    end
  end


end