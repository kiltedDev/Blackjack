require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new }
  let(:deck) { Deck.new }
  let(:card2) {Card.new("2", "♣")}
  let(:card6) {Card.new("6", "♥")}
  let(:card10) {Card.new("10", "♦")}
  let(:face) {Card.new("Q", "♥")}
  let(:ace) {Card.new("A", "♠")}

  describe "#new" do
    it "creates a hand of cards" do
      expect(hand).to be_a(Hand)
    end

    it "creates a hand capable of holding cards" do
      expect(hand.cards).to be_an(Array)
    end
  end

  describe "#score" do
    it "has a starting score of zero" do
      expect(hand.score).to eq(0)
    end

    it "calculates a score of 12 when dealt numbers" do
      hand.cards << card10
      hand.cards << card2
      expect(hand.score).to eq(12)
    end

    it "calculates a score of 12 when dealt a face card" do
      hand.cards << card2
      hand.cards << face
      expect(hand.score).to eq(12)
    end

    it "calculates a score of 21 when dealt an ace and a 10" do
      hand.cards << card10
      hand.cards << ace
      expect(hand.score).to eq(21)
    end

    it "calculates a score of 17 when dealt an ace, a ten and a six" do
      hand.cards << card10
      hand.cards << card6
      hand.cards << ace
      expect(hand.score).to eq(17)
    end
  end

  describe "#busted" do
    it "knows if a hand is busted" do
      hand.cards << card6
      hand.cards << card10
      hand.cards << face
      expect(hand.busted).to be(true)
    end
  end

  describe "#hit" do
    it "should take the top card of the deck and add it to the hand" do
      top_card = deck.collection[-1]
      hand.hit(deck)
      expect(hand.cards[0].value).to eq(top_card.value)
    end
  end
end
