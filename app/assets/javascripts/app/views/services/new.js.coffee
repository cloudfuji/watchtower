App.NewServiceView = Ember.View.extend
  templateName: 'app/templates/services/edit'
  ,classNames: ['menu']
  ,tagName: 'form'
  ,closeClick: ->
    @$().hide()
  ,init: ->
    @_super()
    @set('service', App.Service.create())
  ,submit: (event) ->
    service = @get('service')
    event.preventDefault()
    self = @
    service.save()
           .fail((e) ->
              console.log("error", e))
           .done( ->
              App.servicesController.pushObject(service)
              self.$().hide())
