require "chess_pieces/pawn.rb"


shared_examples "a chess piece" do
  it { is_expected.to respond_to(:valid_moves) }
end



describe Pawn do

end