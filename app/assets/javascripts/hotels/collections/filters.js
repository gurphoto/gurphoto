Application.closure.apply(function(a, u, j){
  a.define('Collection', 'Filters', {
    url: '/hotel/filters.json',

    initialize: function(){
      this.super(arguments);
      this.allValues = new a.Collection.FilterItems;
      this.allValues.on('reset', this.updateValues, this);

      this.on('reset', function(){
        this.allValues.fetch();
      });
    },

    updateValues: function(collection){
      var values = collection.groupBy(function(m){
        return m.get('filter_id');
      });

      u.each(values, function(models, filterId){
        var filter = this.findById(filterId)

        filter.set('values', models);
        filter.trigger('change');
      }, this);
    }
  });
});
