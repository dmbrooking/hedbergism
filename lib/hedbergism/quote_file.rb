module Hedbergism
  class QuoteFile
    
    def initialize(filename)
      @lines = File.readlines(filename)
    end
    
    def firstline
      @lines[0].chomp
    end
    
    def random
      @lines.sample
    end
    
  end
end