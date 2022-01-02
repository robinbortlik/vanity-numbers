require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution5
  class VanityNumber

    def initialize(number)
      @number = number
    end

    def find_words
      data[@number]
    end

    private

    def data
      @data ||= Oj.load(
        File.read("#{__dir__}/../generated_data/dictionary.json")
      )
    end
  end
end
