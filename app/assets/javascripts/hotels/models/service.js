Application.closure.apply(function(a, u, j){
  a.define('Model', 'Service', {
    initialize: function(){
      this.set('state', this.get('default'));
      this.on('change:state', function(){
        this.collection.sort()
      }, this);
    }
  });
});
