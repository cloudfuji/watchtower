App.WatchtowerView = Ember.View.extend
  templateName: 'app/templates/watchtower'
  ,iconClick: (evt) ->
    @$('.menu').center().show()
  ,didInsertElement: ->
    @$('#watchtower')
        .center()
        .fadeIn('slow' , App.servicesObserver.renderTree)
