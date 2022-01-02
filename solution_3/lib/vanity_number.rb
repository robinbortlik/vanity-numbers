require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution3
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      words = []
      raw_data(@number[0]).each do |line|
        words.push(line.strip) if @number == PhoneButtons.text_to_num(line)
      end
      words
    end

    private

    def raw_data(dir_name)
      @raw_data ||= File.open("#{__dir__}/../generated_data/#{dir_name}/dictionary.txt")
    end
  end
end
