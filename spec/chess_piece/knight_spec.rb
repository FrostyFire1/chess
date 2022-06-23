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

  describe "#valid_moves" do
    let(:board) { Array.new(8) { Array.new(8) }}

    context "Returns valid moves when the knight is" do
      it "in the top right corner" do
      knight = described_class.new(0,7,"white")
      valid_moves = knight.valid_moves(board)
      expected  = [[1,5],[2,6]]
      expect(valid_moves).to match_array(expected)
      end

      it "in the top left corner" do
        knight = described_class.new(0,0,"white")
        valid_moves = knight.valid_moves(board)
        expected  = [[2,1],[1,2]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom left corner" do
        knight = described_class.new(7,0,"white")
        valid_moves = knight.valid_moves(board)
        expected  = [[5,1],[6,2]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom right corner" do
        knight = described_class.new(7,7,"white")
        valid_moves = knight.valid_moves(board)
        expected  = [[6,5],[5,6]]
        expect(valid_moves).to match_array(expected)
      end

      it "on the edge of the board" do
        knight = described_class.new(3,7,"white")
        valid_moves = knight.valid_moves(board)
        expected  = [[5,6],[4,5],[1,6],[2,5]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the middle of the board" do
        knight = described_class.new(3,3,"white")
        valid_moves = knight.valid_moves(board)
        expected  = [[1,2],[2,1],[1,4],[2,5],[5,2],[4,1],[5,4],[4,5]]
        expect(valid_moves).to match_array(expected)
      end
    end
  end
end