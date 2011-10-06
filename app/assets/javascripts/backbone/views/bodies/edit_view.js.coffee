Luna.Views.Bodies ||= {}

class Luna.Views.Bodies.EditView extends Backbone.View
  template : JST["backbone/templates/bodies/edit"]
  
  events :
    "submit #edit-body" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (body) =>
        @model = body
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this