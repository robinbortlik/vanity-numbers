require_relative './spec_helper'

describe PhoneButtons do

  describe "#char_to_num" do

    ("A".."C").each do |char|
      context "when char is #{char}" do
        it "is 2" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 2
        end
      end
    end

    ("D".."F").each do |char|
      context "when char is #{char}" do
        it "is 3" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 3
        end
      end
    end

    ("G".."I").each do |char|
      context "when char is #{char}" do
        it "is 4" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 4
        end
      end
    end

    ("J".."L").each do |char|
      context "when char is #{char}" do
        it "is 5" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 5
        end
      end
    end

    ("M".."O").each do |char|
      context "when char is #{char}" do
        it "is 6" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 6
        end
      end
    end

    ("P".."S").each do |char|
      context "when char is #{char}" do
        it "is 7" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 7
        end
      end
    end

    ("T".."V").each do |char|
      context "when char is #{char}" do
        it "is 8" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 8
        end
      end
    end

    ("W".."Z").each do |char|
      context "when char is #{char}" do
        it "is 9" do
          expect(
            PhoneButtons.char_to_num(char)
          ).to eq 9
        end
      end
    end
  end


  describe "#text_to_num" do

    it "translate text to number" do
      expect(
        PhoneButtons.text_to_num("example")
      ).to eq("3926753")
    end
  end
end
