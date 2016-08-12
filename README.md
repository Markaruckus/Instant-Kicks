# Instant-Kicks
## Online shoe store with Uber Rush and Stripe Checkout integration
## Miss Louise's Class (she's the best)

### Sumamry
* Using Picnic CSS library (alternative to Bootstrap)
```
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/picnicss/6.1.1/picnic.min.css">
``` 
* Additional CSS added via assets/stylesheets files
* External link to about page (you know where it goes ;)
* Created developer UberRUSH account for API wrapper
  * Had to use dummy US address as UBERrush developer *(not sure if production as well)* currently only supports NY, CH and LA
  * Credentials (OAuth token) for my developer account located in `config/initializers/uber_rush.rb`

### Details
* Database model
  * Product
  * Description
  * Price
  * Picture (images borrowed from external URL)
* Products controller
  * All
  * Show
  * Quote
  * Order
  * Done (placeholder only)
* Routes
  * post Quote
  * post Order
  * get Done
* Views
  * Index
  * Show
  * Done
*
