require_relative 'quote'

module Hedbergism
  class QuoteFile
    
    attr_reader :lines
    
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
      i = rand(@lines.length)
      puts @i
      [@lines[i].to_s, i]
    end
    
    def line(line_num)
        @lines[line_num].to_s
    end
    
  end
end