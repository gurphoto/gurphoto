// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require nested_form
//= require fancybox/jquery.easing-1.3.pack
//= require fancybox/jquery.mousewheel-3.0.4.pack.js
//= require fancybox/jquery.fancybox-1.3.4.js
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position
//= require jquery.ui.slider
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-ru
//= require tinymce

jQuery(function(j){
  j('a[rel="gallery"]').fancybox({
    overlayColor: '#000',
    titleShow: true
  });

  j('a[rel="tooltip"]').tooltip({
    placement: 'right'
  });

  j('a[data-remote][data-replace]').live('ajax:beforeSend', function(){
    var replaceElement = j(j(this).data('replace'));
    replaceElement.css('position', 'relative').append('<div class="js-loader"></div>').find('div.js-loader').width(replaceElement.width()).height(replaceElement.height());
  });

  j('a[data-remote][data-replace]').live('ajax:success', function(event, data){
    j(j(this).data('replace')).html(data);
  });

  j('input.typeahead').each(function(){
    j(this).typeahead({
      source: j(this).data('source'),
      matcher: function (item){
        try {
          return ~item.toLowerCase().indexOf(this.query.toLowerCase());
        } catch(e) {
          return ''
        }
      }
    });
  });

  j('form').submit(function(){
    j('input[type=submit]', this).attr('disabled', 'disabled');
  });

  //save_hotel_search_query
  j('input[name=save_hotel_search_query]').change(function(){
    var input = j(this);
    j.post(input.data('save-url'), { save_hotel_search_query: input.attr('checked') == 'checked' ? 1 : 0 });
  });

  // Ajax basket
  function updateBasket(incrementCount){
    var block = j('div.basket-items');
    var countBlock = j('span.count', block);

    if(incrementCount)
      countBlock.html(parseInt(countBlock.html()) + 1);

    j.getJSON('/baskets.json', function(data){
      block.css('display', data.length > 0 ? 'block' : 'none');
      countBlock.html(data.length.toString());
    })
  }

  if(j('div.basket-items').length > 0)
    setInterval(updateBasket, 10000);

  j('a.add-to-basket').click(function(){
    var link = j(this);

    if(link.hasClass('added'))
      return false;

    j.post('/baskets', { id: j(this).data('room') })

    link
      .html('Номер добавлен в корзину')
      .addClass('added')
      .toggleClass('btn-success');

    updateBasket(true);

    return false;
  });

  j('div.reviews .change-published').click(function(){
    var link = j(this);
    j.ajax({ url: link.data('url'), type: 'put', data: { hotel_review: { published: !link.hasClass('unpublished') } } });
    link.text(!link.hasClass('unpublished') ? 'Снять с публикации' : 'Опубликовать');
    link.toggleClass('unpublished btn-inverse btn-success');
    return false;
  });
});
