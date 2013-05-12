(function(j, c){
  Application.View.Link = Application.Base.ItemView.extend({
    tagName: 'tr',
    templateName: 'link',

    events: {
      'click .edit': 'editAction',
      'click .delete': 'removeAction',

      'click .save': 'saveAction',
      'click .cancel': 'cancelAction',

      'click .view': 'viewAction',
      'click .play': 'playAction',

      'click .link': 'linkAction',
      'click .favorit': 'favoritAction',

      'click .name': 'openAction',
      'click': 'selectAction',

      'dblclick .text': 'editAction',
      'keypress .field input': 'editKeyPressAction',
    },

    initialize: function(){
      Application.Base.ItemView.prototype.initialize.apply(this, arguments);

      this.model.bind('change', this.render, this);
      this.model.bind('destroy', this.remove, this);
    },

    openAction: function(e){
      if(e.target.href.indexOf('#') === -1)
        return false;
    },

    favoritAction: function(){
      this.model.set('isFavorit', !this.model.get('isFavorit'));

      if(Backbone.history.fragment !== 'favorites')
        this.render();
      else
        j(this.el).fadeOut(400);

      return false;
    },

    linkAction: function(){
      alert('Link copy to clipboard... it\'s a lie!');
      return false;
    },

    playAction: function(){
      alert('You can hear me.');
      return false;
    },

    viewAction: function(){
      alert('You can see me.');
      return false;
    },

    saveAction: function(){
      this.model.set('name', j(this.el).find('.field input').val());
      this.render();

      return false;
    },

    cancelAction: function(){
      this.render();
      return false;
    },

    editKeyPressAction: function(e){
      if(e.which === 13)
        this.saveAction();
      else if(e.which === 27)
        this.cancelAction();
    },

    editAction: function(){
      var row = j(this.el);
      var field = row.find('.field input');

      var fieldElement = field[0];
      var namePosition = this.model.get('name').lastIndexOf('.');

      row.find('.field').show();
      row.find('.text').hide();

      field.focus();

      //Select only filename without extension
      if(namePosition > -1){
        if(fieldElement.selectionStart !== undefined){
          fieldElement.selectionStart = 0;
          fieldElement.selectionEnd = namePosition;
        }
        else if(document.selection !== undefined && document.selection.createRange !== undefined){
          var range = document.selection.createRange();

          range.collapse();
          range.moveStart('character', 0);
          range.moveEnd('character', namePosition);
          field.select();
        }
        else
          field.select();
      }
      else
        field.select();

      return false;
    },

    removeAction: function(){
      var model = this.model;
      var row = j(this.el);

      row.fadeOut(300, function(){
        row.remove();
        model.destroy();
      });

      j('div.tooltip').remove();

      this.model.selected = false;
      this.trigger('select', this.model);

      return false;
    },

    selectAction: function(){
      this.model.selected = j(this.el).toggleClass('selected').hasClass('selected');
      this.trigger('select', this.model);
    }
  });
})(jQuery, _);
