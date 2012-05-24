require 'hedbergism/quote'

describe Hedbergism::Quote do

  before do
    line = "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\""
    @quote = Hedbergism::Quote.new(line)
  end
  
  it "gets split into proper chunks" do
    @quote.chunks
    @quote.chunk[0].should == "I bought a doughnut and they gave me a receipt for the doughnut. I don't"
    @quote.chunk[1].should == "need a receipt for the doughnut. I'll just give you the money, and you" 
    @quote.chunk[2].should == "give me the doughnut, end of transaction. We don't need to bring ink and"
    @quote.chunk[3].should == "paper into this. I just can't imagine a scenario where I would have to" 
    @quote.chunk[4].should == "prove that I bought a doughnut. Some skeptical friend: \"Don't even act" 
    @quote.chunk[5].should == "like I didn't get that doughnut! I got the documentation right here...oh," 
    @quote.chunk[6].should == "wait it's at home...in the file...under \"D\", for \"doughnut.\""
  end
     
  context "just a quote" do
    it "has a quote" do
      @quote.quote.should == "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\""
    end
    
    it "does not have a location" do
      @quote.location.should == nil
    end
    
    it "does not have a date" do
      @quote.date.should == nil
    end
   
    it "has a string representation" do
      @quote.to_s.should == <<END
################################################################################
#                                                                              #
# I bought a doughnut and they gave me a receipt for the doughnut. I don't     #
# need a receipt for the doughnut. I'll just give you the money, and you       #
# give me the doughnut, end of transaction. We don't need to bring ink and     #
# paper into this. I just can't imagine a scenario where I would have to       #
# prove that I bought a doughnut. Some skeptical friend: "Don't even act       #
# like I didn't get that doughnut! I got the documentation right here...oh,    #
# wait it's at home...in the file...under "D", for "doughnut."                 #
#                                                                              #
################################################################################
END
    end
  end
  
  context "a quote with a location, no date" do
    before do
      line = "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\"~~The Laff Stop comedy club - Houston, Texas"
      @quote = Hedbergism::Quote.new(line)
    end
       
    it "has a quote" do
      @quote.quote.should == "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\""
    end
    
    it "does has a location" do
      @quote.location.should == "The Laff Stop comedy club - Houston, Texas"
    end
    
    it "does not have a date" do
      @quote.date.should == nil
    end
   
    it "has a string representation" do
      @quote.to_s.should == <<END
################################################################################
#                                                                              #
# I bought a doughnut and they gave me a receipt for the doughnut. I don't     #
# need a receipt for the doughnut. I'll just give you the money, and you       #
# give me the doughnut, end of transaction. We don't need to bring ink and     #
# paper into this. I just can't imagine a scenario where I would have to       #
# prove that I bought a doughnut. Some skeptical friend: "Don't even act       #
# like I didn't get that doughnut! I got the documentation right here...oh,    #
# wait it's at home...in the file...under "D", for "doughnut."                 #
#                                                                              #
#                                   The Laff Stop comedy club - Houston, Texas #
#                                                                              #
################################################################################
END
    end
  end
  
  context "a quote with a location and a date" do
    before do
      line = "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\"~~The Laff Stop comedy club - Houston, Texas~~September 7, 1999"
      @quote = Hedbergism::Quote.new(line)
    end
    
    it "has a quote" do
      @quote.quote.should == "I bought a doughnut and they gave me a receipt for the doughnut. I don't need a receipt for the doughnut. I'll just give you the money, and you give me the doughnut, end of transaction. We don't need to bring ink and paper into this. I just can't imagine a scenario where I would have to prove that I bought a doughnut. Some skeptical friend: \"Don't even act like I didn't get that doughnut! I got the documentation right here...oh, wait it's at home...in the file...under \"D\", for \"doughnut.\""
    end
    
    it "does not have a location" do
      @quote.location.should == "The Laff Stop comedy club - Houston, Texas"
    end
    
    it "does not have a date" do
      @quote.date.should == "September 7, 1999"
    end

    it "has a string representation" do
      @quote.to_s.should == <<END
################################################################################
#                                                                              #
# I bought a doughnut and they gave me a receipt for the doughnut. I don't     #
# need a receipt for the doughnut. I'll just give you the money, and you       #
# give me the doughnut, end of transaction. We don't need to bring ink and     #
# paper into this. I just can't imagine a scenario where I would have to       #
# prove that I bought a doughnut. Some skeptical friend: "Don't even act       #
# like I didn't get that doughnut! I got the documentation right here...oh,    #
# wait it's at home...in the file...under "D", for "doughnut."                 #
#                                                                              #
#                                   The Laff Stop comedy club - Houston, Texas #
#                                                            September 7, 1999 #
#                                                                              #
################################################################################
END
    end
  end
  
end