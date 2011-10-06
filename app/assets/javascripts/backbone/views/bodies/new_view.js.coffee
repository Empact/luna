Luna.Views.Bodies ||= {}

class Luna.Views.Bodies.NewView extends Backbone.View    
  template: JST["backbone/templates/bodies/new"]
  
  events:
    "submit #new-body": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (body) =>
        @model = body
        window.location.hash = "/#{@model.id}"
        
      error: (body, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this