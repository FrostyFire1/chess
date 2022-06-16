class Chess
  def initialize(player_white, player_black)
    @board = Array.new(8) { Array.new(8) }
    @player_white = player_white
    @player_black = player_black
    @current_player = player_white
  end

end
