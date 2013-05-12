Application.closure.apply(function(a, u, j, undefined){
  a.Base.View.List = a.Base.View.extend({
    itemsContainer: '.items',

    initialize: function(){
      a.Base.View.prototype.initialize.apply(this, arguments);

      if(this.item === undefined){
        var name = this.name.replace('View.List.', '').singularize();

        if(a.View.Item[name] !== undefined)
          this.item = a.View.Item[name];
        else
          throw new ReferenceError(this.name + ' has a undefined item.');
      }

      if(this.collection === undefined)
        throw new ReferenceError(this.name + ' has a undefined collection.');
    },

    render: function(){
      this.$el.html(this.template({ collection: this.collection }));

      var itemsContainer = this.$el.find(this.itemsContainer);

      if(itemsContainer.size() < 1)
        throw new ReferenceError(this.name + ' has a undefined container' + this.itemsContainer + '.')

      this.collection.on('reset', this.renderAll, this);
      this.collection.on('add', this.renderOne, this);

      this.trigger('render');

      return this;
    },

    renderOne: function(model){
      var view = new this.item({ model: model });
      this.$el.find(this.itemsContainer).append(view.render().el);
    },

    renderAll: function(){
      this.$el.find(this.itemsContainer).empty();
      this.collection.each(this.renderOne, this);
    }
  });
});
