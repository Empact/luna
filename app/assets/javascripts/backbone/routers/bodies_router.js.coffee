class Luna.Routers.BodiesRouter extends Backbone.Router
  initialize: (options) ->
    @bodies = new Luna.Collections.BodiesCollection()
    @bodies.reset options.bodies

  routes:
    "/new"      : "newBody"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newBody: ->
    @view = new Luna.Views.Bodies.NewView(collection: @bodies)
    $("#bodies").html(@view.render().el)

  index: ->
    @view = new Luna.Views.Bodies.IndexView(bodies: @bodies)
    $("#bodies").html(@view.render().el)

  show: (id) ->
    body = @bodies.get(id)
    
    @view = new Luna.Views.Bodies.ShowView(model: body)
    $("#bodies").html(@view.render().el)
    
  edit: (id) ->
    body = @bodies.get(id)

    @view = new Luna.Views.Bodies.EditView(model: body)
    $("#bodies").html(@view.render().el)
  