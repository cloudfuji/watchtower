App.EditServiceView = Ember.View.extend
  templateName: 'app/templates/services/edit'
  ,classNames: ['menu']
  ,tagName: 'form'
  ,closeClick: ->
    @$().hide()
  ,submit: (event) ->
    service = @get('service')
    event.preventDefault();
    service.save()
           .fail((e) ->
              console.log("error", e))
           .done( ->
              console.log('done!!!', App.servicesController);
              App.servicesController.pushObject(service))
  ,destroyRecord: (event) ->
    event.preventDefault()
    service = @get("service");
    service.destroy()
      .fail((e) ->
          #App.displayError(e)
          console.log("error",e))
      .done((e) ->
          App.servicesController.removeObject(service))
