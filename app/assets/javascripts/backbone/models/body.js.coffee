class Luna.Models.Body extends Backbone.Model
  paramRoot: 'body'

  defaults:
    name: null
    description: null
  
class Luna.Collections.BodiesCollection extends Backbone.Collection
  model: Luna.Models.Body
  url: '/bodies'