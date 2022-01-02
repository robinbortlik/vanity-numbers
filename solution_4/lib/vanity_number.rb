require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution4
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      words = []
      raw_data.each do |line|
        line.strip!
        words.push(line) if match?(line)
      end
      words
    end

    private

    def match?(line)
      (PhoneButtons.char_to_num(line[0]).to_s == @number[0]) &&
      (@number == PhoneButtons.text_to_num(line))
    end

    def raw_data
      @raw_data ||= File.open("#{__dir__}/../../data/dictionary.txt")
    end
  end
end
