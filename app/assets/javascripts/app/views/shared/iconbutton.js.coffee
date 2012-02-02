App.IconButtonView = Ember.View.extend
  showMenu: false
  ,iconClick: (evt) ->
    @set('showMenu', true)
  ,closeClick: (evt) ->
    @set('showMenu', false)
