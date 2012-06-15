require File.expand_path('hedberg', File.dirname(__FILE__))

configure :production do
	require 'haml'
end

run Sinatra::Application