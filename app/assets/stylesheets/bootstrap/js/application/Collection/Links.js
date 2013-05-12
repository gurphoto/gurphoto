(function(j, c){
  Application.Collection.Links = Application.Base.Collection.extend({
    model: Application.Model.Link,
    localStorage: new Store('files'),

    viewCollection: null,
    folderCollection: null,

    sortAttribute: 'name',
    sortDirection: 'asc',

    initialize: function(){
      this.viewCollection = new Application.Collection.ViewLinks;
      //this.folderCollection = new Application.Collection.FolderLinks;
    },

    pullFolder: function(id){
      this.pull(id, function(model){
        return model.get('parentId') == id;
      });
    },

    pullLastDownload: function(){
      this.pull(id, function(model){
        //TODO: this is wrong codition. Fix it
        return model.get('parentId') == 0;
      });
    },

    pullFavorites: function(){
      this.pull('favorites', function(model){
        return model.get('isFavorit') === true;
      });
    },

    pull: function(id, iterator){
      if(parseInt(id) >= 0)
        this.viewCollection.parentModel = this.findByAttribute('id', id);
      else
        this.viewCollection.parentModel = undefined;

      this.viewCollection.reset(this.filter(iterator));
      this.viewCollection.sortAndGroup();
    },

    getFolders: function(parentId){
      var collection = new Application.Collection.Folders;
      var folders = this.filter(function(model){
        return model.get('isFolder') == true && model.get('parentId') == parentId;
      });

      collection.reset(folders);

      return collection;
    }
  });
})(jQuery, _);
