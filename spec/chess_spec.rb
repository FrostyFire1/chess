require "chess.rb"

describe Chess do
  subject(:chess_board) { described_class.new("placeholder","placerholder2")}
  describe "#new_board" do
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

  describe "#move_piece" do
    it "moves the piece to the target position" do
      board = chess_board.instance_variable_get(:@board)
      pawn = Pawn.new(1,0,"black")
      board[1][0] = pawn
      chess_board.move_piece([1,0],[1,2])
      new_position_piece = board[1][2]
      expect(new_position_piece).to eq(pawn)
    end
    it "removes the piece from the old position" do
      board = chess_board.instance_variable_get(:@board)
      pawn = Pawn.new(1,0,"black")
      board[1][0] = pawn
      chess_board.move_piece([1,0],[1,2])
      old_position_piece = board[1][0]
      expect(old_position_piece).to eq(nil)
    end
  end

  describe "#play_turn" do
    before(:each) do
      allow(Display).to receive(:gets).and_return('B1','C2')
      allow(Display).to receive(:validate_position).and_return([1,0])
      allow(chess_board).to receive(:move_piece).and_return(nil)
    end
    it "sends a message to Display.show_chess_board" do
      expect(Display).to receive(:show_chess_board).once
      chess_board.play_turn
    end
    it "sends a message to Display.ask_for_piece" do
      expect(Display).to receive(:ask_for_piece).once
      chess_board.play_turn
    end
    it "sends a message to Display.ask_for_position" do
      expect(Display).to receive(:ask_for_position).once
      chess_board.play_turn
    end
    it "sends a message to move_piece" do
      expect(chess_board).to receive(:move_piece).once
      chess_board.play_turn
    end
  end
end