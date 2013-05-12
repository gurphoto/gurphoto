/**
 *= require_self
 *= require_tree
 */

(function(u, undefined){
  window.Application = {
    closure: {
      getArgs: function(){
        return [window.Application, u, jQuery.noConflict(), undefined]
      },
      apply: function(fn){
        return fn.apply(this, this.getArgs());
      }
    },

    alias: function(alias, value){
      var namespaces = alias.split('.');
      var parent = Application;

      var current = undefined;
      var previous = undefined;
      var previousParrent = undefined;

      while((current = namespaces.shift()) !== undefined){
        if(parent[current] === undefined)
          parent[current] = {};

        previousParrent = parent;
        previous = current;
        parent = parent[current];
      }

      if(value !== undefined)
        previousParrent[previous] = value;

      return parent;
    },

    define: function(namespace, name, protoProps, classProps){
      var baseName = 'Base.' + namespace;
      var base = this.alias(baseName);

      if(u.isEmpty(base))
        throw ReferenceError(base + ' is undefined.');

      var metaData = {
        name: namespace + '.' + name,
        super: function(){
          return base.prototype.initialize.apply(this, arguments);
        },
      };

      this.alias(metaData.name, base.extend(u.extend(metaData, protoProps), classProps));
    },

    //namespaces
    Base: {},
    Model: {},
    Collection: {},
    Router: {},
    View: {}
  };

  u.extend(window.Application, Backbone.Events);

  u.templateSettings = {
    escape      : /\{\{([\s\S]+?)\}\}/g,
    interpolate : /\{\{raw ([\s\S]+?)\}\}/g,
    evaluate    : /<%([\s\S]+?)%>/g
  };

})(_.noConflict());

Application.closure.apply(function(a, u, j){
  //a - application
  //u - undercore
  //j - jQuery

  a.on('ready', u.once(function(){
    //initialize application
  }));

  j(u.bind(a.trigger, a, 'ready'));
});
