Application.closure.apply(function(a, u, j){
  a.define('View.Item', 'Service', {
    events: {
      'click *:checkbox': 'actionChangeState'
    },

    initialize: function(){
      this.super(arguments);
      this.model.on('change', this.render, this);
    },

    actionChangeState: function(e){
      this.model.set('state', j(e.target).attr('checked'));
    }
  });
});
