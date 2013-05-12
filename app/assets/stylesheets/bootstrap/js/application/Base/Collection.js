(function(j, c){
  Application.Base.Collection = Backbone.Collection.extend({
    findByAttribute: function(name, id){
      return this.find(function(model){
        return model.get(name) == id;
      });
    }
  });
})(jQuery, _);
