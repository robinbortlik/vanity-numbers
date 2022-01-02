require 'fileutils'
require_relative "#{__dir__}/../../phone_buttons/lib/phone_buttons"

module Solution6
  class DataGenerator
    class << self

      def generate
        clean
        build_dir
        File.open("#{__dir__}/../generated_data/dictionary.txt", "w") do |f|
          dictionary.values.each do |words|
            f << "#{words.join(',')}\n"
          end
        end
      end

      private

      def clean
        FileUtils.rm_rf("#{__dir__}/../generated_data")
      end

      def build_dir
        FileUtils.mkdir_p("#{__dir__}/../generated_data/").first
      end

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
end
