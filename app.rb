#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit 
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]

	@title = 'Благодарим вас за запись!'
	@message = "Дорогой: #{@username}, Ваш телефон: #{@phone}, Дата и время: #{@datetime}"

	f = File.open './public/users.txt', 'a'
	f.write "Клиент: #{@username}, Телефон: #{@phone}, Дата и время: #{datetime}"
	f.close

	erb :visit
end
