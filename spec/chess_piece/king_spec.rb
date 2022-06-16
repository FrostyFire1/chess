require "chess_pieces/king.rb"
require_relative "piece_behavior.rb"




describe King do
  subject(:generic_king) {described_class.new(1,1,"white")}
  it_behaves_like "a chess piece"

  describe "#to_symbol" do

    context "when the given color is black" do
      subject(:black_king) { described_class.new(1,1,"black")}
      it "returns the correct symbol" do
        expected = "♚"
        actual_symbol = black_king.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is white" do
      subject(:white_king) { described_class.new(1,1,"white")}
      it "returns the correct symbol" do
        expected = "♔"
        actual_symbol = white_king.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is invalid" do
      subject(:invalid_king) { described_class.new(1,1,"I don't know.")}
      it "returns nil" do
        expected = nil
        actual_symbol = invalid_king.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end
  end 
end