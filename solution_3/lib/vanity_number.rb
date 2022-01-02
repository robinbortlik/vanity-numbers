require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution3
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
      dir_name = @number[0]
      @raw_data ||= File.open("#{__dir__}/../generated_data/#{dir_name}/dictionary.txt")
    end
  end
end
