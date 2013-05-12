Application.closure.apply(function(a, u, j){
  a.Base.View.Item = a.Base.View.extend({
    initialize: function(){
      if(this.templateName === undefined)
        this.templateName = this.name.toLowerCase().replace(/\./g, '-');

      this.template = this.getTemplate(this.templateName);
      this.model.on('change', this.render, this);
    },

    render: function(){
      j(this.el).html(this.template(this.model === undefined ? {} : this.model.toJSON()));
      return this;
    }
  });
});
