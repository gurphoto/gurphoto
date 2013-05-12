(function(j, c){
  window.Application = {
    Collection: {},
    Model: {},
    View: {},
    Router: {},
    Base: {}
  };

  _.extend(window.Application, Backbone.Events);

  Application.on('ready', function(){
    var links = new this.Collection.Links;
    var view = new this.View.Links({ collection: links.viewCollection });
    var tree = new this.View.Tree({ collection: links });
    var router = new this.Router.Links({ collection: links });

    links.reset([{
      id: 1,
      parentId: 0,
      name: 'My Photos',
      time: '',
      size: '23Mb',
      isFavorit: false,
      isFolder: true
    }, {
      id: 2,
      name: 'My videos',
      parentId: 0,
      time: '',
      size: '1Mb',
      isFavorit: false,
      isFolder: true
    }, {
      id: 3,
      parentId: 0,
      name: 'Magicka.exe',
      time: '10.24.2012',
      size: '203Mb',
      url: 'link-undefined.jpg',
      isFavorit: false,
      isFolder: false
    }, {
      id: 4,
      parentId: 1,
      name: 'Iandmygirl.jpg',
      time: '10.24.2012',
      size: '1.4Mb',
      isFavorit: false,
      url: 'link-undefined.jpg',
      isFolder: false
    }, {
      id: 5,
      parentId: 0,
      name: 'LoveCats.mp3',
      time: '10.24.2012',
      url: 'link-undefined.jpg',
      size: '7Mb',
      isFavorit: false,
      isFolder: false
    }, {
      id: 6,
      parentId: 0,
      name: 'Rspec.pdf',
      time: '10.24.2012',
      url: 'link-undefined.jpg',
      size: '12Mb',
      isFavorit: false,
      isFolder: false
    }, {
      id: 7,
      parentId: 0,
      name: 'Californication.mp3',
      time: '10.24.2012',
      url: 'link-undefined.jpg',
      size: '5Mb',
      isFavorit: true,
      isFolder: false
    }, {
      id: 8,
      parentId: 0,
      name: 'CoolJs.pdf',
      url: 'link-undefined.jpg',
      time: '10.24.2012',
      size: '67Mb',
      isFavorit: false,
      isFolder: false
    }, {
      id: 9,
      parentId: 0,
      name: 'Ruby and Rails.pdf',
      url: 'link-undefined.jpg',
      time: '9.24.2012',
      size: '23Mb',
      isFavorit: false,
      isFolder: false
    }, {
      id: 10,
      parentId: 1,
      name: 'Travels',
      time: '',
      url: '',
      size: '',
      isFavorit: false,
      isFolder: true
    }, {
      id: 11,
      parentId: 10,
      name: 'Britany.jpg',
      time: '10.24.2012',
      url: 'link-undefined.jpg',
      size: '1Mb',
      isFavorit: true,
      isFolder: false
    }]);

    //links.pullFolder(0);

    Backbone.history.start();
  });
})(jQuery, _);
