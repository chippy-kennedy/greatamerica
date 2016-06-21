require 'sinatra'
require 'sinatra/activerecord'
require 'rubygems'
require 'json'

set :database_file, 'config/database.yml'



Tilt.register Tilt::ERBTemplate, 'html.erb'


class Response < ActiveRecord::Base
	  validates :jobTitle, presence: true, uniqueness: true
		validates :jobDescription, presence: true
end

get '/' do
	erb :home, :format => :layout
end

post '/job' do
	@jobTitle = "Toupe Specialist"
	@jobDescription = "You will groom the heaad's of carrots everywhere"
	
	erb :job, :layout => (request.xhr? ? false : :layout)
end