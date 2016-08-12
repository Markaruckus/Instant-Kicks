# Instant-Kicks
## Online shoe store with Uber Rush and Stripe Checkout integration
## Miss Louise's Class (she's the best)

### Sumamry
* Using Picnic CSS library (alternative to Bootstrap)
```
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/picnicss/6.1.1/picnic.min.css">
``` 
* Additional CSS added via assets/stylesheets files
* Created developer UberRUSH account for API wrapper
  * UBERrush developer *(not sure if production as well)* currently only supports NY, CH and LA
  * Had to use dummy **SHIP FROM** US address located in `config/initializers/uber_rush.rb`
  * Credentials (OAuth token) for my developer account located in `config/initializers/uber_rush.rb`
  * *Initially worked, now getting 501 SSL  error on submission in `log/development.log` when submitting an address on Get a Quote page*
* Created developer Stripe Checkout account to allow dummy credit card entries to be used to complete order.  Details in `config/initializers/stripe.rb` and `views/products/show.html.erb`
* External link to about page (you know where it goes **;)**

### Details
* Database model
  * Product
  * Description
  * Price
  * Picture *(images borrowed from external URL)*
* Products controller
  * All
  * Show
  * Quote
  * Order
  * Done *(placeholder only)*
* Routes
  * post Quote
  * post Order
  * get Done
* Views
  * Index
  * Show
  * Done
*
