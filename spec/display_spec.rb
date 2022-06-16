require "display.rb"

describe Display do
  describe "#sanitize_position" do
    context "when input is a valid chess position" do
      it "returns the column and the row" do
        input = "B2"
        expected = [1,1]
        actual = subject.sanitize_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the input is too long" do
      it "returns nil" do
        input = "asdf"
        expected = nil
        actual = subject.sanitize_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the input is too short" do
      it "returns nil" do
        input = "a"
        expected = nil
        actual = subject.sanitize_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the column is invalid" do
      it "returns nil" do
        input = "12"
        expected = nil
        actual = subject.sanitize_position(input)
        expect(actual).to eq expected
      end
    end
    context "when the row is invalid" do
      it "returns nil" do
        input = "BA"
        input_2 = "B9"
        expected = nil
        actual = subject.sanitize_position(input)
        actual_2 = subject.sanitize_position(input_2)
        expect(actual).to eq expected
        expect(actual_2).to eq expected
      end
    end
  end
end
