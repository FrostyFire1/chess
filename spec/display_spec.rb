require "display.rb"

describe Display do
  describe "#validate_position" do
    context "when input is a valid chess position" do
      it "returns the column and the row" do
        input = "B2"
        expected = [1,1]
        actual = subject.validate_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the input is too long" do
      it "returns nil" do
        input = "asdf"
        expected = nil
        actual = subject.validate_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the input is too short" do
      it "returns nil" do
        input = "a"
        expected = nil
        actual = subject.validate_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the column is invalid" do
      it "returns nil" do
        input = "12"
        expected = nil
        actual = subject.validate_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the row is invalid" do
      it "returns nil" do
        input = "BA"
        expected = nil
        actual = subject.validate_position(input)
        expect(actual).to eq expected
      end
    end
  end
end
