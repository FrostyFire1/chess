require "chess_pieces/king.rb"
require_relative "piece_behavior.rb"
require "chess_pieces/pawn.rb"



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

  describe "#valid_moves" do
    context "Returns valid moves when the king is" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "in the top right corner" do
      top_right_king = described_class.new(0,7,"white")
      valid_moves = top_right_king.valid_moves(board)
      expected  = [[0,6],[1,6],[1,7]]
      expect(valid_moves).to match_array(expected)
      end

      it "in the top left corner" do
        top_left_king = described_class.new(0,0,"white")
        valid_moves = top_left_king.valid_moves(board)
        expected  = [[0,1],[1,1],[1,0]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom left corner" do
        bottom_left_king = described_class.new(7,0,"white")
        valid_moves = bottom_left_king.valid_moves(board)
        expected  = [[6,0],[6,1],[7,1]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom right corner" do
        bottom_right_king = described_class.new(7,7,"white")
        valid_moves = bottom_right_king.valid_moves(board)
        expected  = [[7,6],[6,6],[6,7]]
        expect(valid_moves).to match_array(expected)
      end

      it "on the edge of the board" do
        edge_king = described_class.new(3,7,"white")
        valid_moves = edge_king.valid_moves(board)
        expected  = [[4,7],[4,6],[3,6],[2,6],[2,7]]
        expect(valid_moves).to match_array(expected)
      end
    end

    context "Considers other pieces in the way" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "stops before an ally piece" do
        king = described_class.new(4,5,"white")
        allied_pawn = Pawn.new(4,6,"white")
        board[4][6] = allied_pawn
        valid_moves = king.valid_moves(board)
        expected  = [[3,5],[3,4],[4,4],[5,4],[5,5],[5,6],[3,6]]
        expect(valid_moves).to match_array(expected)
      end

      it "allows attack of enemy piece" do
        king = described_class.new(7,3,"white")
        enemy_pawn = Pawn.new(6,3,"black")
        board[6][3] = enemy_pawn
        valid_moves = king.valid_moves(board)
        expected  = [[7,2],[6,2],[6,3],[6,4],[7,4]]
        expect(valid_moves).to match_array(expected)
      end
    end
  end
end