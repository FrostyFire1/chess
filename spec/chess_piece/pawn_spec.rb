require "chess_pieces/pawn.rb"
require_relative "piece_behavior.rb"




describe Pawn do
  subject(:generic_pawn) {described_class.new(1,1,"white")}
  it_behaves_like "a chess piece"

  describe "#to_symbol" do

    context "when the given color is black" do
      subject(:black_pawn) { described_class.new(1,1,"black")}
      it "returns the correct symbol" do
        expected = "♟"
        actual_symbol = black_pawn.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is white" do
      subject(:white_pawn) { described_class.new(1,1,"white")}
      it "returns the correct symbol" do
        expected = "♙"
        actual_symbol = white_pawn.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is invalid" do
      subject(:invalid_pawn) { described_class.new(1,1,"I don't know.")}
      it "returns nil" do
        expected = nil
        actual_symbol = invalid_pawn.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end
  end 
end