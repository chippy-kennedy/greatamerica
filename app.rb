require 'sinatra'
require 'rubygems'
require 'json'

Tilt.register Tilt::ERBTemplate, 'html.erb'
#set :html, :layout => :layout

get '/' do
	erb :home, :format => :layout
end

post '/job' do
	@user = params[:exampleInputName]
	erb :job, :layout => (request.xhr? ? false : :layout) 
end
