require 'sinatra'
require_relative "lib/caesar"

get '/' do
	erb :index
end

get '/encrypt' do
	message = params["Message"]
	shift = params["Shift"]
	unless message.nil? | shift.nil?
		shift = shift.to_i
		encrypted_message = caesar(message, shift)
	end
	erb :encrypted, :locals => {:encrypted_message => encrypted_message}
end