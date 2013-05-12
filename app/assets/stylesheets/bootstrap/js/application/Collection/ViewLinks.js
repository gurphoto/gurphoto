(function(j, c){
  Application.Collection.ViewLinks = Application.Base.Collection.extend({
    parentModel: undefined,

    initialize: function(){
      this.on('reset', this.resetSelected, this);
    },

    resetSelected: function(){
      this.each(function(model){
        model.selected = false;
      });
    },

    comparator: function(model, next){
      if(this.sortDirection === 'asc')
        return model.get(this.sortAttribute) > next.get(this.sortAttribute);
      else
        return model.get(this.sortAttribute) < next.get(this.sortAttribute);
    },

    sortAndGroup: function(){
      this.sort({ silent: true });

      var groups = c.groupBy(this.models, function(model){
        return model.get('isFolder') ? 'folders' : 'files';
      });

      this.models = [];

      if(groups.folders !== undefined)
        this.models = c.union(this.models, groups.folders);

      if(groups.files !== undefined)
        this.models = c.union(this.models, groups.files);

      this.trigger('reset');
    }
  });
})(jQuery, _);
