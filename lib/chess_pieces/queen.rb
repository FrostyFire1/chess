class Queen
  def initialize(row,column, color)
    @position = [row,column]
    @distance_moved_last_turn = 0
    @symbol = to_symbol(color)
  end

  def to_symbol(color)
    if color == "black"
      "♛"
    elsif color == "white"
      "♕"
    end
  end
end