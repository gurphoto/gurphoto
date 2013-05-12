Application.closure.apply(function(a, u, j){
  a.Base.View = Backbone.View.extend({
    initialize: function(){
      this.loadTemplate();
    },

    getTemplate: function(name){
      if(name === undefined)
        name = this.name.toLowerCase().replace(/\./g, '-');

      var element = j('#' + name);

      if(element.size() > 0)
        return u.template(element.html());

      throw new ReferenceError('Undefined template "' + name + '"');
    },

    loadTemplate: function(name){
      this.template = this.getTemplate(name);
    }
  });
});
