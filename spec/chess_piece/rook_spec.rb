require "chess_pieces/rook.rb"
require_relative "piece_behavior.rb"
require "chess_pieces/pawn.rb"

describe Rook do
  subject(:generic_rook) {described_class.new(1,1,"white")}
  it_behaves_like "a chess piece"

  describe "#to_symbol" do

    context "when the given color is black" do
      subject(:black_rook) { described_class.new(1,1,"black")}
      it "returns the correct symbol" do
        expected = "♜"
        actual_symbol = black_rook.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is white" do
      subject(:white_rook) { described_class.new(1,1,"white")}
      it "returns the correct symbol" do
        expected = "♖"
        actual_symbol = white_rook.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is invalid" do
      subject(:invalid_rook) { described_class.new(1,1,"I don't know.")}
      it "returns nil" do
        expected = nil
        actual_symbol = invalid_rook.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end
  end 

  describe "#valid_moves" do
    context "Returns valid moves when the rook is" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "in the top right corner" do
      top_right_rook = described_class.new(0,7,"white")
      valid_moves = top_right_rook.valid_moves(board)
      expected  = [[0,6],[0,5],[0,4],[0,3],[0,2],[0,1],[0,0],
                   [1,7],[2,7],[3,7],[4,7],[5,7],[6,7],[7,7]]
      expect(valid_moves).to match_array(expected)
      end

      it "in the top left corner" do
        top_left_rook = described_class.new(0,0,"white")
        valid_moves = top_left_rook.valid_moves(board)
        expected  = [[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],
                     [1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom left corner" do
        bottom_left_rook = described_class.new(7,0,"white")
        valid_moves = bottom_left_rook.valid_moves(board)
        expected  = [[6,0],[5,0],[4,0],[3,0],[2,0],[1,0],[0,0],
                     [7,1],[7,2],[7,3],[7,4],[7,5],[7,6],[7,7]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom right corner" do
        bottom_right_rook = described_class.new(7,7,"white")
        valid_moves = bottom_right_rook.valid_moves(board)
        expected  = [[6,7],[5,7],[4,7],[3,7],[2,7],[1,7],[0,7],
                     [7,6],[7,5],[7,4],[7,3],[7,2],[7,1],[7,0]]
        expect(valid_moves).to match_array(expected)
      end

      it "on the edge of the board" do
        edge_rook = described_class.new(3,7,"white")
        valid_moves = edge_rook.valid_moves(board)
        expected  = [[3,6],[3,5],[3,4],[3,3],[3,2],[3,1],[3,0],
                     [2,7],[1,7],[0,7],[4,7],[5,7],[6,7],[7,7]]
        expect(valid_moves).to match_array(expected)
      end
    end

    context "Considers other pieces in the way" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "stop before an ally piece" do
        rook = described_class.new(4,5,"white")
        allied_pawn = Pawn.new(4,2,"white")
        board[4][2] = allied_pawn
        valid_moves = rook.valid_moves(board)
        expected  = [[4,4],[4,3],[4,6],[4,7],
                     [5,5],[6,5],[7,5],[3,5],[2,5],[1,5],[0,5]]
        expect(valid_moves).to match_array(expected)
      end

      it "stop on an enemy piece" do
        rook = described_class.new(7,3,"white")
        enemy_pawn = Pawn.new(3,3,"black")
        board[3][3] = enemy_pawn
        valid_moves = rook.valid_moves(board)
        expected  = [[7,2],[7,1],[7,0],[7,4],[7,5],[7,6],[7,7],
                     [6,3],[5,3],[4,3],[3,3]]
        expect(valid_moves).to match_array(expected)
      end
    end
  end
end