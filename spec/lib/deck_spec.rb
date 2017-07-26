require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe "#new" do
    it "creates a deck of cards" do
      expect(deck).to be_a(Deck)
    end

    it "creates a deck of 52 cards" do
      expect(deck.collection.size).to eq(52)
    end

    it "creates unique cards" do
      expect(deck.collection.uniq.size).to eq 52
    end
  end
end
