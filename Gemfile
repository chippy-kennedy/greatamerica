source 'http://rubygems.org'


gem "sinatra"
gem "json"

gem 'sinatra-static-assets'

#Gifly Hookup
gem 'giphy'

#Curb for curl/http heavy lifting
#gem 'curb' 

# Use ActiveRecord as the ORM
gem "sinatra-activerecord", '~> 2.0'

# Use rake to execute ActiveRecord's tasks
gem "rake"

group :production do
	# Use Postgresql for ActiveRecord
	gem "pg"
end

group :development, :test do
	#Use SQLite for ActiveRecord
	gem 'sqlite3'
end
