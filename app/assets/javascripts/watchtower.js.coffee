window.App ||= Em.Application.create()
App.store = DS.Store.create()

App.WatchtowerView = Em.View.extend
  click: (evt) ->
    alert('launch tower menu')
  didInsertElement: ->
    console.log("omg view rendered?", this, this.$());
    this.$('#watchtower')
        .center()
        .fadeIn('slow', -> App.serviceController.renderTree($(this), $('.service')))

# App.Service = DS.Model.extend
#   service_url: DS.attr('string')
#   ,service_type: DS.attr('string')
#   ,interval: DS.attr('integer')
#   ,status: DS.attr('string')

App.Service = Em.Object.extend
  service_url: null
  ,service_type: 'http'
  ,interval: 5
  ,status: 'okay'


App.serviceController = SC.ArrayProxy.create
  content: [
    App.Service.create service_url: "http://bushi.do"
    App.Service.create service_url: "http://osr.bushi.do"
    App.Service.create service_url: "http://www.gobushido.com"
    App.Service.create service_url: "http://4chan.org", status: 'down'
    App.Service.create service_url: "http://www.facebook.com"
    App.Service.create service_url: "http://www.gamefaq.com", status: 'down'
  ]

  ,loadTodos: ->
    #services = App.store.findAll(App.Service)
    this.pushObject services

  ,renderTree: (centerElement, serviceElements) ->
    console.log("showing tree on", centerElement, serviceElements)

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
      console.log('loopin eles', i, serviceElements[i])
#    for i in [0..n] by 1
      x = cx + r * Math.cos(cone * i)
      y = cy + r * Math.sin(cone * i)


      #Extract the integer value of x and y
      x = Math.round(x)
      y = Math.round(y)

      # new_node = $('<div class="service" />')
      # new_node.css
      #        'left' : x + "px",
      #        'top' :  y + "px"

      console.log('sestting dims', x, y)

      $(element).css({
             'left' : x + "px",
             'top' :  y + "px"})

      $(element).fadeIn('fast')

      #centerElement.parent().append new_node
