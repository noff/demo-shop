class ChatController < ApplicationController

	FAYE_URI = URI.parse("http://localhost:9292/faye")

	def post

		require 'net/http'

		# Clean numbers on client side
		message = {:channel => "/chat", :data => params[:message], :ext => {:token => FAYE_TOKEN}}
		Net::HTTP.post_form(FAYE_URI, :message => message.to_json)


		render :nothing => true
	end

end
