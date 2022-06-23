class King
  attr_accessor(:position, :owner)
  attr_reader(:symbol, :color)
  def initialize(row,column, color)
    @position = [row,column]
    @distance_moved_last_turn = 0
    @color = color
    @owner = nil
    @symbol = to_symbol(color)
  end

  def to_symbol(color)
    if color == "black"
      "♚"
    elsif color == "white"
      "♔"
    end
  end

  def valid_moves(board)
    steps = [[1,-1],[1,1],[-1,-1],[-1,1],
             [1,0],[-1,0],[0,1],[0,-1]]
    row, column = @position
    valid_moves = []
    steps.each do |step|
      row_step, column_step = step
      new_row, new_column = [row+row_step, column+column_step]
      next unless new_row.between?(0,7) and new_column.between?(0,7) # Check chess board bounds

      square_content = board[new_row][new_column]
      next if square_content.color == @color unless square_content.nil? # Check if square has a chess piece of the same color
      
      valid_moves << [new_row,new_column] 
    end
    valid_moves
  end
end