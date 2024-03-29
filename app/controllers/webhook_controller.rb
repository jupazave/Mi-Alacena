class WebhookController < ApplicationController
	protect_from_forgery
	require 'json'
  require "net/https"

	def push
		request.body.rewind
    data_json = JSON.parse request.body.read

    mensaje = "Push vacio"

    if data_json['type'] == "charge.pending"

    	mensaje = "Se ha generado un ticket de pago de $#{data_json['data']['object']['amount']}"

    elsif data_json['type'] == "charge.success"

      

      Payment.create({
      service: true,
      product: data_json['data']['object']['product_name'],
      price: data_json['data']['object']['amount'].to_f,
      fee: data_json['data']['object']['fee'].to_f,
      name: data_json['data']['object']['payment_details']['customer_name'],
      email: data_json['data']['object']['payment_details']['customer_email']
      })

      fecha = nil

      begin

        pago = Landings::Krispykreme.find(data_json['data']['object']['id'])

        pago.pagado = true

        pago.save!

        fecha = pago.fecha_envio

      rescue ActiveRecord::RecordNotFound => e

      end
      
      PaymentNotification.compropago(data_json, fecha).deliver
    		
    	mensaje = "Se recibío un pago de $#{data_json['data']['object']['amount']}"

    end


		url = URI.parse("https://api.pushover.net/1/messages.json")
		req = Net::HTTP::Post.new(url.path)
		req.set_form_data({
		  :token => "asv7qonu2q2mvrg8p5NyPE8DgoWvK7",
		  :user => "ue2ge2a8HTBSMZVEMsxvKBrMPgb8Ms",
		  :message => mensaje,
		})
		res = Net::HTTP.new(url.host, url.port)
		res.use_ssl = true
		res.verify_mode = OpenSSL::SSL::VERIFY_PEER
		res.start {|http| http.request(req) }

		render :json => {:status => "OK", :mensaje => mensaje}

	end

	def paypal
    #response = validate_IPN_notification(request.raw_post)
    response = "VERIFIED"
    case response
    when "VERIFIED"



    	mensaje = "Push vacio"

	    if params[:payment_status] == "Completed"

        PaymentNotification.paypal(params).deliver

        Payment.create({
          service: false,
          product: params[:item_name1],
          price: params[:mc_gross].to_f,
          fee: params[:mc_fee].to_f,
          name: "#{params[:first_name]} #{params[:last_name]}",
          email: params[:email]
        })

	    	mensaje = "Se ha recibido un pago en paypal de $#{params[:mc_gross]} #{params[:mc_currency]}"

	    end
      url = URI.parse("https://api.pushover.net/1/messages.json")
			req = Net::HTTP::Post.new(url.path)
			req.set_form_data({
			  :token => "asv7qonu2q2mvrg8p5NyPE8DgoWvK7",
			  :user => "ue2ge2a8HTBSMZVEMsxvKBrMPgb8Ms",
			  :message => mensaje,
			})
			res = Net::HTTP.new(url.host, url.port)
			res.use_ssl = true
			res.verify_mode = OpenSSL::SSL::VERIFY_PEER
			res.start {|http| http.request(req) }
    when "INVALID"
      # log for investigation
    else
      # error
    end
    render :nothing => true
  end 


  protected 
  def validate_IPN_notification(raw)
    uri = URI.parse('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 60
    http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    response = http.post(uri.request_uri, raw,
                         'Content-Length' => "#{raw.size}",
                         'User-Agent' => "My custom user agent"
                       ).body
  end
end
