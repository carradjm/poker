require "rspec"
require "card"

describe Card do

  describe "Card should initialize properly" do

  let(:card) { Card.new(:deuce, :hearts) }

    it "should have a suit and a value" do
      expect(card.value).to eq(2)
      expect(card.suit).to eq("♥")
    end


  end

end