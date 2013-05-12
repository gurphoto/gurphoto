/**
 *= require ./../inflection
 *= require ./../swfupload/swfupload
 *= require_tree ./../skeleton
 *= require_self
 *= require_tree
 */

Application.closure.apply(function(a, u, j){
  a.on('ready', u.once(function(){
    var services = new a.Collection.Services;
    var servicesView = new a.View.List.Services({ collection: services });

    var filters = new a.Collection.Filters;
    var filtersView = new a.View.List.Filters({ collection: filters });

    var images = new a.Collection.Images;
    var imagesView = new a.View.List.Images({ collection: images });

    var rooms = new a.Collection.Rooms;
    var roomsView = new a.View.List.Rooms({ collection: rooms });

    var hotel = new a.Model.Hotel;
    var form = new a.View.Form({ model: hotel,
      services: servicesView, filters: filtersView,
      images: imagesView, rooms: roomsView });

    services.fetch();
    filters.fetch();
    images.fetch();

    j('#container').append(form.render().el);
  }));
});
