require 'sinatra'
# root path
get '/' do
  erb :index
end

get '/new-path' do
	erb :new_path
end

get '/:name' do
	"This is #{params[:name]}'s page"
end

