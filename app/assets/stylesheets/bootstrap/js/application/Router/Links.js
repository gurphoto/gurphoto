(function(j, c){
  Application.Router.Links = Application.Base.Router.extend({
    collection: null,

    routes: {
      '': 'pullRootFolder',
      'favorites': 'pullFavorites',
      'folder/:id': 'pullFolder',
    },

    defaultRoute: function(){
      console.log('load');
    },

    initialize: function(options){
      this.collection = options.collection;
    },

    pullRootFolder: function(){
      this.pullFolder(0);
    },

    pullFolder: function(id){
      this.collection.pullFolder(id);
    },

    pullFavorites: function(){
      this.collection.pullFavorites();
    }
  });
})(jQuery, _);
