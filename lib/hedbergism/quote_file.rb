require_relative 'quote'

module Hedbergism
  class QuoteFile
    
    def initialize(file_name)
      @lines = []
      File.readlines(file_name).each do |line|
        addQuote(line)
      end
    end
    
    def addQuote(line)
      @lines.push(Quote.new(line))
    end
    
    def firstline
      @lines[0].to_s
    end
    
    def random
      @lines.sample.to_s
    end
    
  end
end