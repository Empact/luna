Luna.Views.Bodies ||= {}

class Luna.Views.Bodies.IndexView extends Backbone.View
  template: JST["backbone/templates/bodies/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.bodies.bind('reset', @addAll)
   
  addAll: () ->
    @options.bodies.each(@addOne)
  
  addOne: (body) ->
    view = new Luna.Views.Bodies.BodyView({model : body})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(bodies: @options.bodies.toJSON() ))
    @addAll()
    
    return this