App.Service = Ember.Resource.extend
  url: '/services' # resource url poorly named
  ,name: "service"
  ,properties:['service_url', 'status']
  # defaults
  ,service_url: null
  ,status: "200"
  ,statusClass: -> #CSS classes can't start with digits...
    "http"+@get('status')
  ,validate: ->
    if !@get('service_url')
      "Service Url must be entered"
