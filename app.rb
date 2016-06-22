require 'sinatra'
require 'sinatra/activerecord'
require 'rubygems'
require 'json'

set :database_file, 'config/database.yml'

Tilt.register Tilt::ERBTemplate, 'html.erb'
USER_CLICK_COUNT = 0

class Response < ActiveRecord::Base
	  validates :jobTitle, presence: true, uniqueness: true
		validates :jobDescription, presence: true
	
end

#1. Read the Total # of Jobs in DB
before '/' do
	TOTAL_JOBS = Response.all.size
end

#2. Load Home Page/Form
get '/' do
	erb :home, :format => :layout
end

#3. Match input to matching job id
post '/job' do
	sel = 1 + params[:first].sum % TOTAL_JOBS
	res = Response.find_by id: sel

	print "\nSelection #: " + sel.to_s + "\n"
	print "Response:: " + res.to_s + "\n\n"

	@jobTitle = res.jobTitle
	@jobDescription = res.jobDescription 
	
	erb :job, :layout => (request.xhr? ? false : :layout)
end

#4. Optional Custom Responses
get '/add' do
	erb :add, :format => :layout
end

post '/add' do
	r = Response.new
	r.jobTitle = params[:title]
	r.jobDescription = params[:description]
	r.created_at = Time.now
	r.updated_at = Time.now
	r.save!
	redirect '/thanks'
end

#5. Submit Response Redirect
get '/thanks' do
	erb :thanks, :format => :layout
end
