App.servicesObserver = Ember.Object.create
  _before: null
  ,_after: null

  ,renderTree: ->
    centerElement = $('#watchtower')
    return if centerElement.length == 0

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

      new_pos = left: x+"px"
                ,top: x+"px"

      $(element).data({
        'old_left': x
        'old_top' : y
      })

      $(element).animate({
             'left' : x + "px",
             'top' :  y + "px"})

      $(element).fadeIn('fast')

   ,arrayWillChange: -> false
   arrayDidChange: -> @renderTree()
