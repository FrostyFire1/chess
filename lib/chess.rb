require_relative "chess_pieces/pawn.rb"
require_relative "chess_pieces/rook.rb"
require_relative "chess_pieces/knight.rb"
require_relative "chess_pieces/bishop.rb"
require_relative "chess_pieces/queen.rb"
require_relative "chess_pieces/king.rb"
require_relative "display.rb"
class Chess
  attr_reader(:board)
  def initialize(player_white, player_black)
    @board = Array.new(8) { Array.new(8) }
    @player_white = player_white
    @player_black = player_black
    @current_player = player_white
  end

  def new_board
    @board[0] = [Rook.new(0,0,"black"),Knight.new(0,1,"black"),Bishop.new(0,2,"black"),Queen.new(0,3,"black"),
                King.new(0,4,"black"),Bishop.new(0,5,"black"),Knight.new(0,6,"black"),Rook.new(0,7,"black")]
    @board[1].each_with_index do |black_pawn_square, i|
      @board[1][i] = Pawn.new(1,i,"black")
    end

    @board[7] = [Rook.new(7,0,"white"),Knight.new(7,1,"white"),Bishop.new(7,2,"white"),Queen.new(7,3,"white"),
                King.new(7,4,"white"),Bishop.new(7,5,"white"),Knight.new(7,6,"white"),Rook.new(7,7,"white")]
    @board[6].each_with_index do |black_pawn_square, i|
    @board[6][i] = Pawn.new(1,i,"white")
    end

  end

  def move_piece(current_pos, new_pos)
    new_pos => new_row,new_column
    current_pos => current_row,current_column
    piece = @board[current_row][current_column]
    @board[new_row][new_column] = piece
    @board[current_row][current_column] = nil
  end
  
end