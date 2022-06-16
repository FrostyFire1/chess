
class Rook
  def initialize(row,column, color)
    @position = [row,column]
    @distance_moved_last_turn = 0
    @moved_at_all = false
    @symbol = to_symbol(color)
  end

  def to_symbol(color)
    if color == "black"
      "♜"
    elsif color == "white"
      "♖"
    end
  end
end