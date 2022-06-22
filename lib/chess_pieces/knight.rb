class Knight
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
      "♞"
    elsif color == "white"
      "♘"
    end
  end

  def valid_moves(board)
    move_list = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]
    valid = []
    row, column = @position
    move_list.each do |move|
      step_row, step_column = move
      new_row = row + step_row
      new_column = column + step_column
      new_position = [new_row,new_column]
      valid << [new_row,new_column] if new_row.between?(0,7) && new_column.between?(0,7)
    end
    valid
  end
end