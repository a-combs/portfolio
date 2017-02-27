require 'dotenv'
require 'sinatra'
Dotenv.load

require 'sendgrid-ruby'
include SendGrid




get '/' do
	puts 'test test'
  erb :root
end

get '/contact' do
	erb :contact
end

get '/projects' do
	erb :projects

end

# get '/project/:name' do
# 	puts '_____________'
# 	puts params.inspect
# 	puts '_____________'
# 	"Hello, #{params[:name]}. Your email address is #{params[:email]}"
# end

get '/dotenv' do
	"test: #{ENV['SENDGRID_API_KEY']}"
end

post '/send-email' do
	puts '_____________'
	puts params.inspect
	puts '_____________'

	params[:name] + params[:email] + params[:thoughts]

	from = Email.new(email: params[:email])
	to = Email.new(email: 'streeteducated512@gmail.com')
	subject = 'Sending with SendGrid is Fun'
	content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers
	params[:name] + params[:email] + params[:thoughts]

end