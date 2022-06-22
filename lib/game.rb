require_relative "chess.rb"
require_relative "player.rb"
player_1 = Player.new("John","white")
player_2 = Player.new("Mary","black")
game = Chess.new(player_1,player_2)
game.new_board
game.play_turn
game.play_turn