require "chess_pieces/knight.rb"
require_relative "piece_behavior.rb"




describe Knight do
  subject(:generic_knight) {described_class.new(1,1,"white")}
  it_behaves_like "a chess piece"

  describe "#to_symbol" do

    context "when the given color is black" do
      subject(:black_knight) { described_class.new(1,1,"black")}
      it "returns the correct symbol" do
        expected = "♞"
        actual_symbol = black_knight.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is white" do
      subject(:white_knight) { described_class.new(1,1,"white")}
      it "returns the correct symbol" do
        expected = "♘"
        actual_symbol = white_knight.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is invalid" do
      subject(:invalid_knight) { described_class.new(1,1,"I don't know.")}
      it "returns nil" do
        expected = nil
        actual_symbol = invalid_knight.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end
  end 
end