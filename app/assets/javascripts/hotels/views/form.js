Application.closure.apply(function(a, u, j){
  a.define('View', 'Form', {
    initialize: function(options){
      this.super(arguments);

      this.services = options.services;
      this.filters = options.filters;
      this.images = options.images;
      this.rooms = options.rooms;

      this.$el.addClass('tab-content');
    },

    render: function(){
      this.$el.html(this.template(this.model.toJSON()));

      this.$el.find('.service-fields').html(this.services.render().el);
      this.$el.find('.filter-fields').html(this.filters.render().el);
      this.$el.find('.image-fields').html(this.images.render().el);
      this.$el.find('.rooms').html(this.rooms.render().el);

      return this;
    }
  });
});
