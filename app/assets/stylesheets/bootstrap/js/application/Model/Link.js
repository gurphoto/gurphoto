(function(j, c){
  Application.Model.Link = Application.Base.Model.extend({
    selected: false,

    initialize: function(){
      this.updateStates();

      this.on('change:name', this.updateStates, this);
      this.on('destroy', this.destroyChildren, this);
    },

    updateStates: function(){
      this.set('icon', this.getIcon());
      this.set('canSee', this.getIcon() === 'picture');
      this.set('canPlay', this.getIcon() === 'music');
      this.set('parentId', parseInt(this.get('parentId')));
    },

    getIcon: function(){
      if(this.get('isFolder'))
        return 'folder-open';

      if(this.get('name').match(/\.jpg|jpeg|gif|png$/))
        return 'picture';

      if(this.get('name').match(/\.ogg|mp3$/))
        return 'music';

      return 'file';
    },

    destroyChildren: function(model, collection){
      collection.each(function(model){
        if(model.get('parentId') === this.id)
          model.destroy();
      }, model);
    }
  });
})(jQuery, _);
