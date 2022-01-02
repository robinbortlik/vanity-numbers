require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution1
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      words = []
      raw_data.each do |word|
        word.strip!
        words.push(word) if match?(word)
      end
      words
    end

    private

    def match?(word)
      @number == PhoneButtons.text_to_num(word)
    end

    def raw_data
      @raw_data ||= File.open("#{__dir__}/../../data/dictionary.txt")
    end
  end
end
