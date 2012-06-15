require 'sinatra'
require_relative 'lib/hedbergism/quote_file'

get '/' do
  #content_type :txt
  
  file_name = File.join(File.dirname(__FILE__), 'bin/quotes.csv')
  quotes = Hedbergism::QuoteFile.new(file_name).random
  
  haml :index, :locals => {:quote => quotes}
end

__END__
@@layout
!!! 5
%html
  %head
    %meta(charset="utf-8")
    %title Hedbergism - A single, random quote from Mitch Hedberg
    %script(type="text/javascript"
            src="/js/ga.js")
    %link(rel="stylesheet" type="text/css" href="/css/styles.css")
  %body
    = yield