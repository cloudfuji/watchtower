App.servicesController = Ember.ResourceController.create
  type: App.Service

App.servicesController.addArrayObserver(App.servicesObserver)
