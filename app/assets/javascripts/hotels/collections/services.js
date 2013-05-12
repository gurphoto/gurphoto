Application.closure.apply(function(a, u, j){
  a.define('Collection', 'Services', {
    url: '/hotel/services.json',

    comparator: function(a, b){
      return !a.get('state');
    }
  });
});
