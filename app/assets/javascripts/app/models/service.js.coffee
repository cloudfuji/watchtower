App.Service = Ember.Resource.extend
  url: '/services' #resource url poorly named
  ,name: "service"
  ,properties:['service_url', 'status']
  ,service_url: null
  ,status: "200"
