require_relative './spec_helper'

describe Solution2::VanityNumber do

  describe "find_words" do
    it "translate numbers to words" do
      expect(
        Solution2::VanityNumber.new("966").find_words
      ).to eq(["won", "woo", "yom", "yon", "zoo"])
    end
  end
end
