Application.closure.apply(function(a, u, j){
  a.define('View.List', 'Services', {
    itemsContainer: '.full-items',

    renderOne: function(model){
      var view = new this.item({ model: model });
      var element = view.render().el;

      this.$el.find(model.get('state') ? '.full-items' : '.checkbox-items').append(element);
    },

    renderAll: function(){
      this.$el.find('.full-items, .checkbox-items').empty();
      this.collection.each(this.renderOne, this);
    }
  });
});
