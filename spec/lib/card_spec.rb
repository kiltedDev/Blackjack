require "spec_helper"

RSpec.describe Card do
  let(:card2) {Card.new("2", "♣")}
  let(:card6) {Card.new("6", "♥")}
  let(:card10) {Card.new("10", "♦")}
  let(:facecard) {Card.new("Q", "♥")}
  let(:ace_card) {Card.new("A", "♠")}

  describe "#new" do
    it "creates a playing card" do
      expect(ace_card).to be_a(Card)
    end

    it "creates a playing card with a value" do
      expect(ace_card.value).to eq("A")
    end

    it "creates a playing card with a suit" do
      expect(ace_card.suit).to eq("♠")
    end

  end

  describe "type" do
    it "checks the type of a card" do
      expect(ace_card.type).to eq("Ace")
    end
  end

  describe "#worth" do
    it "evaluates numerals as their value" do
      expect(card6.worth).to eq(6)
    end

    it "evaluats the worth of a face card as 10" do
      expect(facecard.worth).to eq(10)
    end

    it "evaluates the worth of an ace to 11" do
      expect(ace_card.worth).to eq(11)
    end
  end
end
