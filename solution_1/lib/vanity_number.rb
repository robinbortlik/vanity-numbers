require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution1
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      words = []
      raw_data.each do |line|
        line.strip!
        words.push(line) if @number == PhoneButtons.text_to_num(line)
      end
      words
    end

    private

    def raw_data
      @raw_data ||= File.open("#{__dir__}/../../data/dictionary.txt")
    end
  end
end
