require 'rubygems'
require 'httparty'
module Uber 

	# Default pickup location, for single-store implementations 
	PICKUP = { 
		location: { 
			address: "40 W 57th Street", 
			city: "New York", 
			state: "New York", 
			postal_code: "10019", 
			country: "US" 
		}, 
		contact: { 
			company_name: "Innovative IT Consulting Solutions, Inc.", 
			email: "markaruckus@hotmail.com", 
			phone: { 
				number: "+14162681530", 
				sms_enabled: true 
			} 
		} 
	} 
	
	class RUSH 
		include HTTParty 
		attr_reader :base_path 
		
		# Sandbox URI, Change to Production when Ready 
		base_uri 'https://sandbox-api.uber.com/v1/deliveries' 
		
		# Gets OAuth Token on new Instance 
		def initialize 
			url = "https://login.uber.com/oauth/v2/token" 
			token = self.class.post(url, 
				body: { 
					client_id: ENV['0piM7cLb0E7mcI7Y7trd1yFz7x10XCuS'], 
					client_secret: ENV['DoFhO12o0NSCV8yrzLWGqMY46wbIex7lYddz9sty'], 
					grant_type: 'client_credentials', 
					scope: 'delivery' 
				} 
			)["access_token"] 
			
			@base_path = "?access_token=#{token}" 
		end 
		
		# Gets all deliveries on your account 
		def all_deliveries 
			url = "#{base_path}" 
			self.class.get(url) 
		end 
		
		# Gets one specified delivery on your account 
		def one_delivery(id) 
			url = "/#{id}#{base_path}" 
			self.class.get(url) 
		end 
		
		# Returns a delivery quote 
		def delivery_quote(pickup_obj = Uber::PICKUP, dropoff_obj) 
			url = "/quote#{base_path}" 
			
			self.class.post(url, 
				body: { pickup: pickup_obj, dropoff: dropoff_obj }.to_json, 
				headers: { 'Content-Type' => 'application/json' } 
			) 
		end 
		
		# Creates a delivery and returns a delivery object 
		def create_delivery(items_arr, pickup_obj = Uber::PICKUP, dropoff_obj) 
			url = "#{base_path}" 
			
			self.class.post(url, 
				body: { items: items_arr, pickup: pickup_obj, dropoff: dropoff_obj }.to_json, 
				headers: { 'Content-Type' => 'application/json' } 
			) 
		end 
			
		# Changes delivery status to client_canceled 
		def cancel_delivery(id) 
			url = "/#{id}/cancel#{base_path}" 
			self.class.post(url) 
		end 
	end 
end