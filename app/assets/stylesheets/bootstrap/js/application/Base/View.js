(function(j, c){
  Application.Base.View = Backbone.View.extend({
    get: function(id){
      return j('#' + id);
    },

    getTemplate: function(name){
      var element = this.get('template-' + name);

      if(element.size() > 0)
        return element.html();

      throw new ReferenceError('Undefined template "' + name + '"');
    }
  });
})(jQuery, _);
