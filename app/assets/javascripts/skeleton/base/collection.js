Application.closure.apply(function(a, u, j){
  a.Base.Collection = Backbone.Collection.extend({
    initialize: function(){
      var name = this.name.replace('Collection.', '').singularize();

      if(a.Model[name] !== undefined)
        this.model = a.Model[name];
    },

    findById: function(id){
      return this.find(function(model){
        return model.get('id') == id;
      });
    }
  });
});
