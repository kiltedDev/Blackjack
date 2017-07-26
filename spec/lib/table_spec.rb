require "spec_helper"

RSpec.describe Table do
  let(:table) { Table.new }

  describe "#new" do
    it "creates a table for playing cards" do
      expect(table).to be_a(Table)
    end

    it "opens a deck for the table" do
      expect(table.deck).to be_a(Deck)
    end

    it "deals to the table" do
      expect(table.dealer).to be_a(Hand)
    end
  end

  describe "#deal" do
    it "creates a hand for the dealer" do
      table.deal
      expect(table.dealer).to be_a(Hand)
    end

    it "creates a hand for the player" do
      table.deal
      expect(table.dealer).to be_a(Hand)
    end

    it "deals two cards to the player" do
      table.deal
      expect(table.player.cards.size).to eq(2)
    end

    it "deals two cards to the dealer" do
      table.deal
      expect(table.dealer.cards.size).to eq(2)
    end
  end

  describe "#status" do
    it "presents the table status" do
      table.deal
      expect(table.status).to be_a(String)
    end
  end
end
