require 'sinatra'
require_relative 'lib/hedbergism/quote_file'

file_name = File.join(File.dirname(__FILE__), 'bin/quotes.csv')
quotes = Hedbergism::QuoteFile.new(file_name)

get '/' do
  #content_type :txt
 
  quote, index = quotes.random
  
	permalink = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{index}"
  
  haml :index, :locals => {:quote => quote, :permalink => permalink}
end

get '/:id' do |id|
  quote = quotes.line(id.to_i)
  
  haml :index, :locals => {:quote => quote}
end

get '/channel.html' do
  File.read(File.join('public', 'channel.html'))
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
  %div#fb-root
  :javascript
    window.fbAsyncInit = function() {
      FB.init({
        appId      : 'hedbergism', // App ID
        channelUrl : '//www.hedbergism.com/channel.html', // Channel File
        status     : true, // check login status
        cookie     : true, // enable cookies to allow the server to access the session
        xfbml      : true  // parse XFBML
      });
      // Additional initialization code here
    };

    // Load the SDK Asynchronously
    (function(d){
      var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
      if (d.getElementById(id)) {return;}
      js = d.createElement('script'); js.id = id; js.async = true;
      js.src = "//connect.facebook.net/en_US/all.js";
      ref.parentNode.insertBefore(js, ref);
      }(document));
    
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=407537325948061";
      fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
  = yield
-#   #bg
-#      %img(src="/images/bg.jpg")
  