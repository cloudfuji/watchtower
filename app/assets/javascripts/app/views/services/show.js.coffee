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
  ,didInsertElement: ->
     App.servicesObserver.renderTree()
     self = @
     App["serviceInterval"+@service.id] = window.setInterval(->
        $.getJSON(self.service._url()+".json").success (json) ->
          old_service = self.get('service')
          self.set('service', old_service.deserialize(json))

          village = self.$('.village')
          starting_offset = village.offset()
          starting_pos = parseInt(village.css('background-position-y'),10)

          # self.$('.village:not(:animated)').animate({
          #     "background-size": "50%"
          #     ,"background-position-y": (starting_pos/2)+"px"
          #   }, 500).animate({
          #   "background-size": "100%"
          #   ,"background-position-y": starting_pos+"px"
          # }, 500)

          # console.log("moving background to ", starting_pos, (starting_pos/2)+"px");
          self.$('.village:not(:animated)').animate({
            height: '50px'
            ,width: '50px'
            ,"background-position-y": (starting_pos/2)+"px"
             ,top: starting_offset.top+25+"px"
             ,left: starting_offset.left+25+"px"
          }, 500).animate({
            height: '100px'
            ,width: '100px'
            ,"background-position-y": starting_pos+ "px"
             ,top: starting_offset.top+"px"
             ,left: starting_offset.left+"px"
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
