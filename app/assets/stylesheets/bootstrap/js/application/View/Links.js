(function(j, c){
  Application.View.Links = Application.Base.View.extend({
    el: '#files-container',

    events: {
      'click .multi-actions .delete': 'deleteAction',
      'click .multi-actions .links': 'linksAction',
      'click .sort': 'sortAction'
    },

    initialize: function(){
      this.collection.on('add', this.render, this);
      this.collection.on('reset', this.render, this);
      this.collection.on('reset', this.updateRowSelect, this);
    },

    render: function(e){
      var container = j(this.el).find('tbody');

      container.empty();

      if(this.collection.parentModel !== undefined){
        var parentModel = this.collection.parentModel;
        var parent = new Application.View.ParentLink({ model: parentModel });

        container.append(parent.render().el);
      }

      if(this.collection.length === 0)
        container.append((new Application.View.EmptyLink).render().el);

      this.collection.each(function(model){
        var view = new Application.View.Link({ model: model });

        view.on('select', this.updateRowSelect, this);
        container.append(view.render().el);
      }, this);
    },

    updateRowSelect: function(){
      var count = 0;

      this.collection.each(function(model){
        if(model.selected)
          ++count;
      });

      this.setActionsVisible(count > 0);
    },

    setActionsVisible: function(value){
      j(this.el).find('.multi-actions').toggleClass('hidden', !value);
    },

    sortAction: function(e){
      var link = j(e.target);

      this.collection.sortAttribute = link.data('by');
      this.collection.sortDirection = link.hasClass('desc') ? 'asc' : 'desc';
      this.collection.sort();

      j(this.el).find('a.sort').removeClass('desc').removeClass('asc');
      link.addClass(this.collection.sortDirection);

      return false;
    },

    linksAction: function(){
      var links = [];

      this.collection.each(function(model){
        if(model.selected)
          links.push(model.get('name'));
      });

      alert(links.join('\n'));

      return false;
    },

    deleteAction: function(){
      j(this.el).find('.selected .delete').click();
    }
  });
})(jQuery, _);
