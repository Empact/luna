Luna.Views.Bodies ||= {}

class Luna.Views.Bodies.BodyView extends Backbone.View
  template: JST["backbone/templates/bodies/body"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this