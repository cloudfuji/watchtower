App.Service = Ember.Resource.extend
  url: '/services' # resource url poorly named
  ,name: "service"
  ,properties:['service_url', 'status', 'id']
  # defaults
  ,service_url: null
  ,status: "200"
  ,statusClass: Ember.computed(-> #CSS classes can't start with digits...
    return "http"+@get('status')
    ).property('status')
  ,isGlowing: Ember.computed(->
    return parseInt(@status,10) == 500 || 404
  ).property('isGlowing')
  ,validate: ->
    if !@get('service_url')
      "Service Url must be entered"
