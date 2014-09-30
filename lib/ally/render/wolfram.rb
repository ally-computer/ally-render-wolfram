require 'ally/render'
require 'ally/render/wolfram/version'

module Ally
  module Render
    class Wolfram
      include Ally::Render

      require 'wolfram'

      def initialize
        super # do not delete
        @keywords = %w( wolfram )
        @wolfram = ::Wolfram
        @wolfram.appid = @plugin_settings[:appid]
        @ignore_words = %w( wolfram )
      end

      def process(inquiry, io)
        @io = io
        @inquiry = inquiry
        words = @inquiry.words_chomp_punc.map(&:downcase)
        words.delete_if { |w| @ignore_words.include?(w) }
        query_str = words.join(' ')
        result = @wolfram.fetch(query_str)
        result = ::Wolfram::HashPresenter.new(result).to_hash
        ans = result[:pods]['Result']
        ans = ans.first if ans.class == Array
        io.say(ans) unless ans.nil?
      end
    end
  end
end
