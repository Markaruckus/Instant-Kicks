Rails.configuration.stripe = { 
	publishable_key: ENV['pk_test_OyJRoVa8WglRE5ogrJSIhGc2'], 
	secret_key: ENV['sk_test_pdnSycfX5cRo0ZT95OBsd30r'] 
} 

Stripe.api_key = Rails.configuration.stripe[:secret_key]