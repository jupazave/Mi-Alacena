class WebhookController < ApplicationController
	protect_from_forgery
	require 'json'
  require "net/https"

	def push
		request.body.rewind
    data_json = JSON.parse request.body.read

    mensaje = "Push vacio"

    if data_json['type'] == "charge.pending"

    	mensaje = "Se ha generado un ticket de pago de #{data_json['data']['object']['amount']}"

    elsif data_json['type'] == "charge.success"
    		
    	mensaje = "Se recibío un pago de #{data_json['data']['object']['amount']}"

    end


		url = URI.parse("https://api.pushover.net/1/messages.json")
		req = Net::HTTP::Post.new(url.path)
		req.set_form_data({
		  :token => "ag1JgM3uQFte1UgjEYjLNjGuNk2JnK",
		  :user => "ue2ge2a8HTBSMZVEMsxvKBrMPgb8Ms",
		  :message => mensaje,
		})
		res = Net::HTTP.new(url.host, url.port)
		res.use_ssl = true
		res.verify_mode = OpenSSL::SSL::VERIFY_PEER
		res.start {|http| http.request(req) }

		render :json => {:status => "OK", :mensaje => mensaje}

	end
end
