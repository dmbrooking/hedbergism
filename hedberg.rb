require 'sinatra'
require_relative 'lib/hedbergism/quote_file'

get '/' do
  content_type :txt
  
  file_name = File.join(File.dirname(__FILE__), 'bin/quotes.csv')
  quotes = Hedbergism::QuoteFile.new(file_name).random
  
  haml :index, :locals => {:quote => quotes}
end