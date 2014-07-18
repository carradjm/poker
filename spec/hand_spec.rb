require 'rspec'
require 'hand.rb'

describe Hand do

    # let(:deck) { Deck.new }
    # let(:hand) { Hand.new(deck) }

    # context "Initializes properly?" do
    #
    #   it "Should initialize with 5 cards" do
    #     expect(hand.cards.count).to eq(5)
    #     hand.cards.each do |card|
    #       expect(card).to be_a(Card)
    #     end
    #   end
    #
    #   it "should not share any cards with another hand" do
    #     other_hand = Hand.new(deck)
    #     other_hand.cards.each do |card|
    #       expect(hand.cards).to_not include(card)
    #     end
    #   end
    #
    # end
    #
    # context "Returning values and suits for hand ranking" do
    #
    #   it "should return string representations of card values"
    #
    #   it "should return string representations of card suits"
    #
    # end

    context "Returns card value strings" do
      let(:hand) { Hand.new([Card.new(:five, :hearts),
                             Card.new(:three, :spades),
                             Card.new(:five, :spades),
                             Card.new(:five, :clubs),
                             Card.new(:five, :diamonds)])
                  }

      it "should return an array of strings of card values" do
        expect(hand.return_card_values).to eq ([5,3,5,5,5])
      end

    end

    context "Hand Rankings" do

      context "Straight Flush" do
        let(:hand) { Hand.new([Card.new(:deuce, :hearts),
                               Card.new(:three, :hearts),
                               Card.new(:four, :hearts),
                               Card.new(:five, :hearts),
                               Card.new(:six, :hearts)])
                    }
              it "should return if a hand is a Straight Flush" do
                expect(hand.straight_flush?).to eq(true)
              end
      end

      context "Four of a Kind" do
        let(:hand) { Hand.new([Card.new(:five, :hearts),
                               Card.new(:three, :spades),
                               Card.new(:five, :spades),
                               Card.new(:five, :clubs),
                               Card.new(:five, :diamonds)])
                    }

        it "should return if a hand is Four of a Kind" do
          expect(hand.four_of_a_kind?).to be true
        end




      end

      context "Full House" do
        let(:hand) { Hand.new([Card.new(:deuce, :hearts),
                             Card.new(:deuce, :spades),
                             Card.new(:deuce, :clubs),
                             Card.new(:seven, :hearts),
                             Card.new(:seven, :clubs)])
                  }

      it "should return if a hand is a Full House" do
        expect(hand.full_house?).to eq(true)
      end
    end

      context "Flush" do
        let(:hand) { Hand.new([Card.new(:deuce, :hearts),
                               Card.new(:three, :hearts),
                               Card.new(:seven, :hearts),
                               Card.new(:queen, :hearts),
                               Card.new(:ace, :hearts)])
                    }

        it "should return if a hand is a Flush" do
          expect(hand.flush?).to be true
        end
      end

      context "Straight" do
        let(:hand) { Hand.new([Card.new(:deuce, :hearts),
                               Card.new(:three, :hearts),
                               Card.new(:four, :spades),
                               Card.new(:five, :hearts),
                               Card.new(:six, :hearts)])
                    }
        it "should return if a hand is a Straight" do
        expect(hand.straight?).to eq(true)
      end

      let(:hand) { Hand.new([Card.new(:ace, :hearts),
                            Card.new(:deuce, :clubs),
                             Card.new(:three, :hearts),
                             Card.new(:four, :spades),
                             Card.new(:five, :hearts)])
                  }

      it "should work with a low Ace (A2345)" do
        expect(hand.straight?).to eq(true)
      end

      let(:hand) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:jack, :clubs),
                             Card.new(:queen, :hearts),
                             Card.new(:king, :spades),
                             Card.new(:ace, :hearts)])
                  }

      it "should work with a high Ace (10JQKA)" do
        expect(hand.straight?).to eq(true)
      end
    end

    context "Three of a Kind" do
      let(:hand) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:ten, :clubs),
                             Card.new(:ten, :diamonds),
                             Card.new(:king, :spades),
                             Card.new(:ace, :hearts)])
                  }

      it "should return if a hand is Three of a Kind" do
        expect(hand.three_of_a_kind?).to eq(true)
      end
    end

    context "Two Pair" do
      let(:hand) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:ten, :clubs),
                             Card.new(:king, :diamonds),
                             Card.new(:king, :spades),
                             Card.new(:ace, :hearts)])
                  }

      it "should return if a hand has Two Pair" do
        expect(hand.two_pair?).to eq(true)
      end
    end

    context "One Pair" do
      let(:hand) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:ten, :clubs),
                             Card.new(:king, :diamonds),
                             Card.new(:queen, :spades),
                             Card.new(:ace, :hearts)])
                  }

      it "should return if a hand has One Pair" do
        expect(hand.one_pair?).to eq(true)
      end
    end

    context "High Card" do
      let(:hand) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:ten, :clubs),
                             Card.new(:king, :diamonds),
                             Card.new(:queen, :spades),
                             Card.new(:ace, :hearts)])
                  }

      it "should return high card value" do
        expect(hand.high_card).to eq(14)
      end
    end
  end

  context "Correctly Sets Hand Ranking" do
    let(:hand) { Hand.new([Card.new(:ten, :hearts),
                          Card.new(:ten, :clubs),
                           Card.new(:king, :diamonds),
                           Card.new(:queen, :spades),
                           Card.new(:ace, :hearts)])
                }

    it "should update Hand Ranking" do
      expect{ hand.rank_hand }.to change { hand.hand_ranking }
            .from( nil )
            .to( :one_pair )
    end
  end

  context "Determines winning hand" do
  let(:hand1) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:ten, :clubs),
                             Card.new(:king, :diamonds),
                             Card.new(:king, :spades),
                             Card.new(:ace, :hearts)])
                  }
  let(:hand2) { Hand.new([Card.new(:ten, :hearts),
                            Card.new(:jack, :clubs),
                             Card.new(:queen, :hearts),
                             Card.new(:king, :spades),
                             Card.new(:ace, :hearts)])}
      it "Should determine the winnner" do
        hand1.rank_hand
        hand2.rank_hand
        expect((hand1).maybe_beat(hand2)).to eq(-1)
      end
    end
end


# context "Swaps out card correctly?" do
#
#   it "should remove the cards from your hand & give you new cards" do
#     cards = hand.cards.sample(2)
#     hand.swap_cards(cards)
#     cards.each {|card| expect(hand.cards).to_not include(card)}
#     expect(hand.cards.length).to eq(5)
#   end
#
# end