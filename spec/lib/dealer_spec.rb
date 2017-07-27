require "spec_helper"

RSpec.describe Dealer do
  let(:dealer) { Dealer.new }

  describe "#new" do
    it "creates a dealer for playing cards" do
      expect(dealer).to be_a(Dealer)
    end

    it "opens a deck for the dealer" do
      expect(dealer.deck).to be_a(Deck)
    end

    it "deals to the dealer" do
      expect(dealer.house).to be_a(Hand)
    end
  end

  describe "#deal" do
    it "creates a hand for the dealer" do
      dealer.deal
      expect(dealer.house).to be_a(Hand)
    end

    it "creates a hand for the player" do
      dealer.deal
      expect(dealer.house).to be_a(Hand)
    end

    it "deals two cards to the player" do
      dealer.deal
      expect(dealer.player.cards.size).to eq(2)
    end

    it "deals two cards to the dealer" do
      dealer.deal
      expect(dealer.house.cards.size).to eq(2)
    end
  end

  describe "#status" do
    it "presents the dealer status" do
      dealer.deal
      expect(dealer.status).to be_a(String)
    end
  end
end
