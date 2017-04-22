require 'sinatra'
require_relative "lib/caesar"

get '/' do
	message = params["Message"]
	shift = params["Shift"]
	unless message.nil? | shift.nil?
		shift = shift.to_i
		encrypted_message = caesar(message, shift)
	end
	erb :index, :locals => {:encrypted_message => encrypted_message}
end