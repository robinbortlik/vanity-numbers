require 'fileutils'
require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution3
  class DataGenerator
    class << self

      def generate
        clean
        raw_data.each do |word|
          word.strip!
          number = PhoneButtons.text_to_num(word)
          dir = build_dir(number[0])
          append(dir, word)
        end
      end

      private

      def clean
        FileUtils.rm_rf("#{__dir__}/../generated_data")
      end

      def build_dir(name)
        FileUtils.mkdir_p("#{__dir__}/../generated_data/#{name}").first
      end

      def append(dir, str)
        File.open("#{dir}/dictionary.txt", "a") { |f| f << "#{str}\n" }
      end

      def raw_data
        @raw_data ||= File.open("#{__dir__}/../../data/dictionary.txt")
      end
    end
  end
end
