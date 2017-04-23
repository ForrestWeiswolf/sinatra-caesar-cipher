require 'sinatra'
require 'sinatra/reloader'
require_relative "lib/caesar"

get '/' do
	erb :index
end

get '/encrypt' do
	message = params["Message"]
	shift = params["Shift"]
	unless message.nil? | shift.nil?
		shift = shift.to_i
		shift *= -1 if params["mode"] == "Decrypt"
		encrypted_message = caesar(message, shift)
	end
	erb :result, :locals => {:encrypted_message => encrypted_message, :mode => params["mode"]}
end