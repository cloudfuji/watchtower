window.App ||= Em.Application.create()
App.store = DS.Store.create()

App.WatchtowerView = Em.View.extend
  classNames: ['watchtower']
  click: (evt) ->
    alert('launch tower menu')
  didInsertElement: ->
    this.$()
        .center()
        .fadeIn('slow' )


App.ServiceView = Ember.View.extend
  templateName: 'app/templates/services/show',
  classNames: ['service']


App.ServiceMenu = Ember.View.extend
  classNames: ['menu', 'service_menu']
  ,closeMenu: ->
    this.$().hide()


App.ListServicesView = Ember.View.extend
  servicesBinding: 'App.servicesController'

  ,refreshListing: ->
    App.servicesController.findAll();


App.Service = Ember.Resource.extend
  url: '/services'


App.servicesController = Ember.ResourceController.create
  type: App.Service


App.servicesObserver = Ember.Object.create
  _before: null
  ,_after: null

  ,renderTree: ->

    centerElement = $('.watchtower:first')
    serviceElements = $('.service')
    #Define the center of the circle (cs,cy)
    cx = centerElement.offset().left
    cy = centerElement.offset().top

    #This has to be get from the server side
    n = serviceElements.length     #Number of child nodes
    r = 200                              #The radious of the circle

    #Calculate r if the number of child nodes are grater than 10
    if n > 10
      r = r + r * n

    cone = 2 * (22 / 7) / n

    x = null
    y = null

    for element, i in serviceElements

      x = cx + r * Math.cos(cone * i)
      y = cy + r * Math.sin(cone * i)

      #Extract the integer value of x and y
      x = Math.round(x)
      y = Math.round(y)

      console.log('sestting dims', x, y)

      $(element).css({
             'left' : x + "px",
             'top' :  y + "px"})

      $(element).fadeIn('fast')

   ,arrayWillChange: -> console.log('array changing');
   arrayDidChange: -> console.log('array did change');

App.servicesController.addArrayObserver(App.servicesObserver)
