require "faye"
require File.expand_path("../config/initializers/faye_token.rb", __FILE__)

class ServerAuth
	def incoming(message, callback)
		if message["channel"] !~ %r{^/meta/}
			if message["ext"]["token"] != FAYE_TOKEN
				message["error"] = "Invalid authentication token"
			end
		end
		callback.call(message)
	end
end

Faye::WebSocket.load_adapter('thin')

faye_server = Faye::RackAdapter.new(:mount => "/faye", :timeout => 25, :extensions => [ServerAuth.new])
run faye_server