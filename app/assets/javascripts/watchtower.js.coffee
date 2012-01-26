App = Em.Application.create()
App.store = DS.Store.create()


Building = Em.Object.extend
  status: null
  ,sprite: null

Watchtower = Building.extend({})

Village = Building.extend
  service_url: null

Service = DS.Model.extend
  service_url: null
  ,service_type: 'http'

App.CoolView = Ember.View.extend
  templateName: 'watchtower'
  ,wot: "super cool"

App.ChildView = Ember.View.extend
  templateName: 'child_view'
  ,echo: "cool child echo"
