require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution6
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      words = nil
      raw_data.each do |line|
        line.strip!
        if match?(line)
          words = line.split(",")
          break
        end
      end
      words
    end

    private

    def match?(line)
      first_character_match?(line) && first_word_match?(line)
    end

    def first_character_match?(line)
      PhoneButtons.char_to_num(line[0]).to_s == @number[0]
    end

    def first_word_match?(line)
      first_word = line.slice(/[a-zA-Z]*/)
      @number == PhoneButtons.text_to_num(first_word)
    end

    def raw_data
      @raw_data ||= File.open("#{__dir__}/../generated_data/dictionary.txt")
    end
  end
end
