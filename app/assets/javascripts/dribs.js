$(function() {
  "use strict";

  $('.header-shot-slider').lightSlider({
      item: 1,
      auto: true,
      loop: true,
      slideMargin: 10,
      controls: false,
      pauseOnHover: true
  });

  // Back to top
  $('#scroll-up').on( 'click', function() {
    $('html, body').animate({scrollTop : 0}, 600);
    return false;
  });

  // Image gallery
  // initGallery();

  // Smoothscroll to anchor
  $('a[href^="#"]:not([href="#"])').on('click', function(){
    var id = $(this).attr('href');
    if ($(id).size() > 0) {
      $('html, body').animate({scrollTop: $(id).offset().top}, 600);
    }
    return false;
  });

  // Smoothscroll to anchor in page load
  var hash = location.hash.replace('#','');
  if (hash != '' && $("#"+hash).size() > 0) {
    $('html, body').animate({scrollTop: $("#"+hash).offset().top-100}, 600);
  }

  // Search
  $('.search-opener').on('click', function(){
    $('body').css('overflow', 'hidden');
    $('.search-screen').toggleClass('closed opened');
    $('.search-form input[type="text"]').focus();
  });
  $('.search-closer').on('click', function(){
    $('body').css('overflow', 'auto');
    $('.search-screen').toggleClass('closed opened');
  });

  // Toggle header form visibility
  $('.toggle-form-visibility').on('click', function() {
    $(this).parents('.header-form').parent('div').children('.header-form').toggleClass('visible');
  });

  // Switchery plugin
  if ($('.js-switch').length) {
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
    elems.forEach(function(html) {
      var switchery = new Switchery(html, { size: 'small' });
    });
  }

  if ($('.js-switch-big').length) {
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch-big'));
    elems.forEach(function(html) {
      var switchery = new Switchery(html);
    });
  }

  // Dropify
  $('.dropify').dropify();

  // Equal height for grid view
  $('.equal-blocks .card-block, .equal-cols > div').matchHeight();

  // Add a .body-scrolled to body, when page scrolled
  $(window).on('scroll', function() {
    if ($(document).scrollTop() > 40) {
      $('body.sticky-nav').addClass('body-scrolled');
    }
    else {
      $('body.sticky-nav').removeClass('body-scrolled');
    }
  });

  // jQuery.countTo
  $(window).on('scroll', function() {
    $('.counter span:not(.counted-before)').each(function(index, value) {
      if (isScrolledIntoView(this)) {
        $(this).countTo().addClass('counted-before');
      }
    });
  });

  //
  // FAQ Component
  //
  // Case insensitive contains selector
  jQuery.expr[':'].icontains = function(a, i, m) {
    return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
  };

  // Search
  $('#faq-search input').on('keyup', function(e) {
    var s = $(this).val().trim(),
      result = $("#faq-result .faq-items li");
    $('#faq-result section').show();
    if (s === '') {
      result.show();
    }
    else {
      result.not(':icontains(' + s + ')').hide();
      result.filter(':icontains(' + s + ')').show();
    }

    $('.faq-items').each(function() {
      if ($(this).find('li:visible').size() == 0) {
        $(this).parents('section').hide();
      }
      else {
        $(this).parents('section').show();
      }
    });

    $('.faq-items').unhighlight().highlight(s);
  });


  //
  // Offcanvas
  //
  $('[data-toggle="offcanvas"]').on('click', function (e) {

    e.preventDefault();

    $('body').toggleClass('offcanvas-show');
    $(this).children().toggleClass('ti-menu ti-close');

    if ($('body').hasClass('offcanvas-show')) {
      $('html').css('overflow', 'hidden');
    }
    else {
      $('html').css('overflow', 'visible');
    }

  });

  $(window).on('resize', function(){
    if ($(window).width() > 991) {
      $('body').removeClass('offcanvas-show');
      $('html').css('overflow', 'visible');
    }
  });

});


function isScrolledIntoView(elem)
{
  var $elem = $(elem);
  var $window = $(window);
  var docViewTop = $window.scrollTop();
  var docViewBottom = docViewTop + $window.height();
  var elemTop = $elem.offset().top;
  var elemBottom = elemTop + $elem.height();

  return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}
