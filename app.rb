require 'sinatra'
require 'sinatra/activerecord'
require 'net/http'
require 'rubygems'
require 'json'
require 'curb'

#--------------------------------------------------
#Config
set :database_file, 'config/database.yml'
Tilt.register Tilt::ERBTemplate, 'html.erb'
GIPHY_API_KEY = 'dc6zaTOxFJmzC' 					#public beta version

#--------------------------------------------------
#Class
class Response < ActiveRecord::Base
	  validates :jobTitle, presence: true, uniqueness: true
		validates :jobDescription, presence: true

		def setRandomGifyLink
			sel = rand(150)
			uri = URI("http://api.giphy.com/v1/gifs/search?q=donald+trump&limit=1&offset=#{sel}&fmt=json&api_key=i#{GIPHY_API_KEY}")
			res =  Net::HTTP.get(uri)
			json = JSON.parse(res)
			link = json["data"][0]["images"]["fixed_height"]["url"]
			self.gif = link	
			self.save!
		end
	
end

#--------------------------------------------------
#Routes
#
#1. Read the Total # of Jobs in DB
before '/' do
	TOTAL_JOBS = Response.where(:pending => false).size
end

#2. Load Home Page/Form
get '/' do
	erb :home, :format => :layout
end

#3. Match input to matching job id
post '/job' do
	sel = 1 + params[:first].sum % TOTAL_JOBS
	res = Response.where(:pending => false).find_by id: sel

	print "\nSelection #: " + sel.to_s + "\n"
	print "Response:: " + res.to_s + "\n"

	@jobTitle 			= res.jobTitle
	@gif 						= res.gif
	@jobDescription = res.jobDescription 
	
	erb :job, :layout => (request.xhr? ? false : :layout)
end

#4. Optional Custom Responses
get '/add' do
	erb :add, :format => :layout
end

post '/add' do
	gif_link = params[:gif]
	r = Response.new
	r.jobTitle = params[:title]
	r.jobDescription = params[:description]
	r.created_at = Time.now
	r.updated_at = Time.now
	r.gif = if (gif_link.nil? == true) then r.setRandomGifyLink else gif_link end
	r.pending = true
	r.save!
	redirect '/thanks'
end

#5. Submit Response Redirect
get '/thanks' do
	erb :thanks, :format => :layout
end
