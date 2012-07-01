require_relative '../../hedberg'
require 'rack/test'
require 'sinatra'

set :environment, :test

describe 'Hedbergism App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "Random quote" do

    it "outputs a random quote to index" do
      Hedbergism::QuoteFile.any_instance.stub(:random).and_return(["This is a random quote", 20])
      get '/'
      last_response.body.should =~ /This is a random quote/  
    end
    
    it "generates a permalink for the given quote" do
      Hedbergism::QuoteFile.any_instance.stub(:random).and_return(["This is a random quote", 20])
      get '/'
      last_response.body.should =~ /http:\/\/(.*)20/
    end
      
  end
  
  it "generates a static page for a given quote #" do
    get '/10'
    last_response.body.should =~ /Whenever I go to shave, I assume there's someone else on the planet shaving, so I say, "I'm gonna go shave, too."/
  end
end