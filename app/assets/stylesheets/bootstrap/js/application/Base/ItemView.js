(function(j, c){
  Application.Base.ItemView = Application.Base.View.extend({
    initialize: function(){
      if(this.templateName === undefined)
        throw new ReferenceError('Template name is undefined');

      this.template = _.template(this.getTemplate(this.templateName));
    },

    render: function(){
      j(this.el).html(this.template(this.model === undefined ? {} : this.model.toJSON()));
      return this;
    }
  });
})(jQuery, _);
