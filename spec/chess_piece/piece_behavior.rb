shared_examples "a chess piece" do
  it { is_expected.to respond_to(:to_symbol).with(1).argument }
  it { is_expected.to respond_to(:valid_moves).with(1).argument }
end