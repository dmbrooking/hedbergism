require 'sinatra'
require_relative 'lib/hedbergism/quote_file'

file_name = File.join(File.dirname(__FILE__), 'bin/quotes.csv')
quotes = Hedbergism::QuoteFile.new(file_name)
title = "Hedbergism - A single, random quote from Mitch Hedberg"

get '/' do
  #content_type :txt
 
  quote, index = quotes.random
  
	permalink = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}/#{index}"
  
  haml :index, :locals => {:quote => quote, :permalink => permalink, :title => title}
end

get '/:id' do |id|
  quote = quotes.line(id.to_i)
  
  haml :index, :locals => {:quote => quote, :permalink => permalink, :title => title}
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
    %title #{locals[:title]}
    %script(type="text/javascript"
            src="/js/ga.js")
    %link(rel="stylesheet" type="text/css" href="/css/styles-nobgimage.css")
    %meta{:property => "og:title", :content => "#{locals[:title]}" } 
    %meta{:property => "og:type", :content => "website" }
    %meta{:property => "og:image", :content => "http://www.hedbergism.com/images/icon.jpeg" }
    %meta{:property => "og:url", :content => "http://www.hedbergism.com" }
    %meta{:property => "og:site_name", :content => "Hedbergism" }
    %meta{:property => "fb:app_id", :content => "407537325948061" }
    %meta{:property => "og:description", :content => "#{locals[:quote]}" }
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
  