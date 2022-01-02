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
      (PhoneButtons.char_to_num(line[0]).to_s == @number[0]) &&
      (@number == PhoneButtons.text_to_num(line.slice(/[a-zA-Z]*/)))
    end

    def raw_data
      @raw_data ||= File.open("#{__dir__}/../generated_data/dictionary.txt")
    end
  end
end
