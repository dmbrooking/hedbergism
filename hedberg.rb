require 'sinatra'
require_relative 'lib/hedbergism/quote_file'

file_name = File.join(File.dirname(__FILE__), 'bin/quotes.csv')
quotes = Hedbergism::QuoteFile.new(file_name)

get '/' do
 
  quote, index = quotes.random
  
	permalink = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{index}"
  
  haml :index, :locals => {:quote => quote, :permalink => permalink}
end

get '/:id' do |id|
  quote = quotes.line(id.to_i)
  
  haml :index, :locals => {:quote => quote}
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
    %link(rel="stylesheet" type="text/css" href="/css/styles-nobgimage.css")
  %body
    = yield
-#   #bg
-#      %img(src="/images/bg.jpg")
  