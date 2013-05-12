(function(j, c){
  Application.View.Tree = Application.Base.View.extend({
    el: '#folder-container .items',
    
    collection: null,
    template: null,

    initialize: function(){
      this.collection.on('reset', this.render, this);
    },

    render: function(){
      var folderCollection = this.collection.getFolders(0);
      var container = j(this.el);

      container.empty();

      folderCollection.each(function(model){
        var item = new Application.View.TreeItem({ model: model });
        container.append(item.render().el);
      });
    }
  });
})(jQuery, _);
