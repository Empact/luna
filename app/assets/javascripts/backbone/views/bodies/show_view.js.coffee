Luna.Views.Bodies ||= {}

class Luna.Views.Bodies.ShowView extends Backbone.View
  template: JST["backbone/templates/bodies/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this