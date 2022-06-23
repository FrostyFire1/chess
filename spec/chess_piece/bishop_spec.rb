require "chess_pieces/bishop.rb"
require_relative "piece_behavior.rb"
require "chess_pieces/pawn.rb"



describe Bishop do
  subject(:generic_bishop) {described_class.new(1,1,"white")}
  it_behaves_like "a chess piece"

  describe "#to_symbol" do

    context "when the given color is black" do
      subject(:black_bishop) { described_class.new(1,1,"black")}
      it "returns the correct symbol" do
        expected = "♝"
        actual_symbol = black_bishop.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is white" do
      subject(:white_bishop) { described_class.new(1,1,"white")}
      it "returns the correct symbol" do
        expected = "♗"
        actual_symbol = white_bishop.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end

    context "when the given color is invalid" do
      subject(:invalid_bishop) { described_class.new(1,1,"I don't know.")}
      it "returns nil" do
        expected = nil
        actual_symbol = invalid_bishop.instance_variable_get(:@symbol)
        expect(actual_symbol).to eq(expected)
      end
    end
  end 

  describe "#valid_moves" do
    context "Returns valid moves when the bishop is" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "in the top right corner" do
      top_right_bishop = described_class.new(0,7,"white")
      valid_moves = top_right_bishop.valid_moves(board)
      expected  = [[1,6],[2,5],[3,4],[4,3],[5,2],[6,1],[7,0]]
      expect(valid_moves).to match_array(expected)
      end

      it "in the top left corner" do
        top_left_bishop = described_class.new(0,0,"white")
        valid_moves = top_left_bishop.valid_moves(board)
        expected  = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom left corner" do
        bottom_left_bishop = described_class.new(7,0,"white")
        valid_moves = bottom_left_bishop.valid_moves(board)
        expected  = [[6,1],[5,2],[4,3],[3,4],[2,5],[1,6],[0,7]]
        expect(valid_moves).to match_array(expected)
      end

      it "in the bottom right corner" do
        bottom_right_bishop = described_class.new(7,7,"white")
        valid_moves = bottom_right_bishop.valid_moves(board)
        expected  = [[6,6],[5,5],[4,4],[3,3],[2,2],[1,1],[0,0]]
        expect(valid_moves).to match_array(expected)
      end

      it "on the edge of the board" do
        edge_bishop = described_class.new(3,7,"white")
        valid_moves = edge_bishop.valid_moves(board)
        expected  = [[2,6],[1,5],[0,4],[4,6],[5,5],[6,4],[7,3]]
        expect(valid_moves).to match_array(expected)
      end
    end

    context "Considers other pieces in the way" do
      let(:board) { Array.new(8) { Array.new(8) }}

      it "stop before an ally piece" do
        bishop = described_class.new(7,0,"white")
        allied_pawn = Pawn.new(3,4,"white")
        board[3][4] = allied_pawn
        valid_moves = bishop.valid_moves(board)S
        expected  = [[6,1],[5,2],[4,3]]
        expect(valid_moves).to match_array(expected)
      end

      it "stop on an enemy piece" do
        bishop = described_class.new(6,1,"white")
        enemy_pawn = Pawn.new(3,4,"black")
        board[3][4] = enemy_pawn
        valid_moves = bishop.valid_moves(board)
        expected  = [[7,0],[5,2],[4,3],[3,4],[5,0],[7,2]]
        expect(valid_moves).to match_array(expected)
      end
    end
  end
end