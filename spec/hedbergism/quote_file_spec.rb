require 'hedbergism/quote_file'
require 'hedbergism/quote'

describe Hedbergism::QuoteFile do
  before do
    file_name = File.join(File.dirname(__FILE__), '../../bin/quotes.csv')
    @quotefile = Hedbergism::QuoteFile.new(file_name)
    @quote = @quotefile.lines.pop
  end
   
  it "prints 1st line of file" do
    @quotefile.firstline.should == <<END
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
  
  it "prints a random line" do
    Hedbergism::QuoteFile.any_instance.stub(:random).and_return(@quote.to_s)
    
    @quotefile.random.should == <<END
################################################################################
#                                                                              #
# If I bought a company that made hot dog buns, on Day 1 we would add 2 buns   #
# to every package... Day 2, work on deliciousness.                            #
#                                                                              #
################################################################################
END
  end
  
end