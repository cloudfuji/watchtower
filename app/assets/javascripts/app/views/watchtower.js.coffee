App.WatchtowerView = Ember.View.extend
  templateName: 'app/templates/watchtower'
  ,init: ->
    @_super()
  ,iconClick: (evt) ->
    @$('.menu').center().show()
  ,didInsertElement: ->
    @$('#watchtower')
        .center()
        .fadeIn('slow' , App.servicesObserver.renderTree)
