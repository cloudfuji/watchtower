App.ListServicesView = Ember.View.extend
  templateName: 'app/templates/services/index'
  servicesBinding: 'App.servicesController'
  ,refreshListing: ->
    App.servicesController.findAll();

App.ServiceView = Ember.View.extend
  templateName: 'app/templates/services/show'
  ,iconClass: 'village'
  ,init: ->
    @_super()
    console.log("omg super!", @, @get('service'), @service)
  ,didInsertElement: ->
     App.servicesObserver.renderTree()
     self = @
     App["serviceInterval"+@service.id] = window.setInterval(->
        $.getJSON(self.service._url()+".json").success (json) ->
          old_service = self.get('service')
          self.set('service', old_service.deserialize(json))

          village = self.$('.village')

          self.$('.village:not(:animated)').animate({
            height: (village.height()/2)+"px"
            ,width: (village.width()/2)+"px"
             ,top: ((village.offset().top)+13)+"px"
             ,left: ((village.offset().left)+13)+"px"
          }, 500).animate({
            height: village.height()+'px'
            ,width: village.width()+"px"
             ,top: ((village.offset().top))+"px"
             ,left: ((village.offset().left))+"px"
            }, 500)

     , 3000)
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
