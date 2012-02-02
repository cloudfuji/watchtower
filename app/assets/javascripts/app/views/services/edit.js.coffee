App.EditServiceView = Ember.View.extend
  templateName: 'app/templates/services/edit'
  ,classNames: ['menu']
  ,tagName: 'form'
  ,closeClick: (e) ->
    e.preventDefault()
    @$().hide()
    false
  ,submit: (event) ->
    service = @get('service')
    event.preventDefault()
    service.save()
           .fail((e) ->
              alert("Sorry failed to save this contact"))
           .done((e) ->
              App.servicesController.pushObject(service))
  ,destroyRecord: (event) ->
    @$().disable()
    event.preventDefault()
    self = @
    service = @get("service")
    service.destroy()
           .fail((e, textStatus, errorThrown) ->
             console.log("error",e,textStatus,errorThrown)
             alert('ajax failure'))
           .done((data, textStatuz, jqXHR) ->
             self.$().hide()
             App.servicesController.removeObject(service))
