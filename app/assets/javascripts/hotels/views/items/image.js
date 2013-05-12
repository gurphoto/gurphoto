Application.closure.apply(function(a, u, j){
  a.define('View.Item', 'Image', {
    tagName: 'li',

    initialize: function(){
      this.super(arguments);
      this.$el.addClass('span2');
    },

    events: {
      'click .remove': 'removeAction'
    },

    removeAction: function(e){
      var model = this.model;
      var el = this.$el;

      this.$el.fadeOut(function(){
        model.destroy();
        el.remove();
      });

      return false;
    }
  });
});
