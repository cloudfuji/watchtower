App.ListServicesView = Ember.View.extend
  templateName: 'app/templates/services/index'
  servicesBinding: 'App.servicesController'
  ,refreshListing: ->
    App.servicesController.findAll();

App.ServiceView = Ember.View.extend
  templateName: 'app/templates/services/show'
  ,didInsertElement: ->
    App.servicesObserver.renderTree()
  ,iconClick: (evt) ->
    icon_offset = @$('.service').offset()
    x = icon_offset.left+(@$('.service').width()/2)
    y = icon_offset.top+(@$('.service').height()/2)

    menu = @$('.menu')
    console.log('setting menu cords', x, y);
    menu.css({
      position: 'absolute'
      ,left: (x-(menu.width()/2))+'px'
      ,top: (y-(menu.height()/2))+'px'
    }).show()
