require "chess.rb"

describe Chess do

  describe "#new_board" do
    subject(:chess_board) { described_class.new("placeholder","placerholde2")}
    it "creates a board to start the game" do
      expected_board = [
        [Rook.new(0,0,"black"),Knight.new(0,1,"black"),Bishop.new(0,2,"black"),Queen.new(0,3,"black"),King.new(0,4,"black"),Bishop.new(0,5,"black"),Knight.new(0,6,"black"),Rook.new(0,7,"black")],
        [Pawn.new(1,0,"black"),Pawn.new(1,1,"black"),Pawn.new(1,2,"black"),Pawn.new(1,3,"black"),Pawn.new(1,4,"black"),Pawn.new(1,5,"black"),Pawn.new(1,6,"black"),Pawn.new(1,7,"black")],
        [nil,nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil,nil],
        [nil,nil,nil,nil,nil,nil,nil,nil],
        [Pawn.new(6,0,"white"),Pawn.new(6,1,"white"),Pawn.new(6,2,"white"),Pawn.new(6,3,"white"),Pawn.new(6,4,"white"),Pawn.new(6,5,"white"),Pawn.new(6,6,"white"),Pawn.new(6,7,"white")],
        [Rook.new(7,0,"white"),Knight.new(7,1,"white"),Bishop.new(7,2,"white"),Queen.new(7,3,"white"),King.new(7,4,"white"),Bishop.new(7,5,"white"),Knight.new(7,6,"white"),Rook.new(7,7,"white")]
      ]
      chess_board.new_board
      actual_board = chess_board.instance_variable_get(:@board)
      actual_board.each_index do |row|
        actual_board[row].each_index do |column|
          expected_class = expected_board[row][column].class
          actual_class = actual_board[row][column].class
          expect(actual_class).to eq(expected_class)
        end
      end
    end
  end
end