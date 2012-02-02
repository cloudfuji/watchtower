App.ListServicesView = Ember.View.extend
  templateName: 'app/templates/services/index'
  servicesBinding: 'App.servicesController'
  ,refreshListing: ->
    App.servicesController.findAll();

App.ServiceView = Ember.View.extend
  templateName: 'app/templates/services/show'
  ,iconClass: 'village'
  ,didInsertElement: ->
    App.servicesObserver.renderTree()
  ,iconClick: (evt) ->
    icon_offset = @$('.village').offset()
    x = icon_offset.left+(@$('.village').width()/2)
    y = icon_offset.top+(@$('.village').height()/2)

    menu = @$('.menu')
    menu.css({
      position: 'absolute'
      ,left: (x-(menu.width()/2))+'px'
      ,top: (y-(menu.height()/2))+'px'
    }).show()
