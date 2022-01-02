require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution2
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      dictionary[@number]
    end

    private

    def dictionary
      @dictionary ||= build_dictionary
    end

    def build_dictionary
      raw_data.inject({}) do |hash, word|
        key = PhoneButtons.text_to_num(word)
        hash[key] ||= []
        hash[key].push(word)
        hash
      end
    end

    def raw_data
      @raw_data ||= File.read("#{__dir__}/../../data/dictionary.txt").split("\n")
    end
  end
end
