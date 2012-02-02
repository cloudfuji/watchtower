App.NewServiceView = Ember.View.extend
  templateName: 'app/templates/services/edit'
  ,classNames: ['menu']
  ,tagName: 'form'
  ,closeClick: (e) ->
    e.preventDefault()
    @$().hide()
    false
  ,init: ->
    @_super()
    @set('service', App.Service.create())
  ,submit: (event) ->
    @$().disable()
    service = @get('service')
    event.preventDefault()
    self = @
    service.save()
           .fail((e) ->
              console.log("error", e)
              self.$().enable())
           .done( ->
              App.servicesController.pushObject(service)
              self.$().hide()
              self.$().enable()
              self.set('service', App.Service.create()))
    false
