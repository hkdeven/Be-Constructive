$(function() {

  "use strict";

  //
  // Open shot in a modal
  //
  $('.shot-modal-opener, .shot-preview .img, .shot-preview .black-overlay, .shot-preview .title, .shot-preview .text-overlay, .shot-small .shot-info h6 a').on('click', function(e) {

    e.preventDefault();

    // Put a spinner inside the modal and open it
    $('#shot-modal .modal-content').html('<div class="spinner"><span class="dot1"></span><span class="dot2"></span><span class="dot3"></span></div>');
    $('#shot-modal').modal();

    // Load data from server and initialize the gallery.
    // You can add a data-id="XXX" to each .shot
    /*
    var shotId = $(this).parents('.shot').data('id');
    $('#shot-modal .modal-content').load('shot.php?id='+ shotId, function() {
      initGallery();
      initModalLike();
    });
    */

  // Like buttons
  //
  $('.like').on('click', function() {
    // Resolve shot ID and send an ajax request to update number of likes in database

    // A like inside the .shot-info has clicked
    if ($(this).prop("tagName").toLowerCase() == "a") {
      $(this).children('.fa').toggleClass('fa-heart-o fa-heart');
    }
    // A like icon on the image has clicked
    else {
      $(this).toggleClass('liked');
      if ($(this).text() != "") { // So it has a number inside
        if ($(this).hasClass('liked')) { // Just liked, increase the number
          $(this).text( parseInt($(this).text(), 10) + 1 );
        }
        else { // Removed like, decrease the number
          $(this).text( parseInt($(this).text(), 10) - 1 );
        }
      }
    }

  });


  //
  // Dropzone
  //
  // Visit http://www.dropzonejs.com/ for more options and see how you can handle uploaded files
  Dropzone.autoDiscover = false;
  $(".dropzone").dropzone({
    url: "target.php",
    dictDefaultMessage: '<span class="dropzone-file-icon"></span>Drag and drop a file here or click'
  });


});


//
// Like button doesn't work in modals because of Ajax content loading
//
function initModalLike() {
  $('.modal .like').on('click', function() {
    // Resolve shot ID and send an ajax request to update number of likes in database
    $(this).children('.fa').toggleClass('fa-heart-o fa-heart');
  });
}


//
// Config gallery and slider in single shot page
//
// Visit http://sachinchoolur.github.io/lightslider/ and http://sachinchoolur.github.io/lightGallery/ for more options
function initGallery() {
  $('.image-gallery').lightSlider({
    gallery:true,
    item:1,
    loop:true,
    thumbItem: 5,
    slideMargin:0,
    enableDrag: true,
    currentPagerPosition:'left',
    onSliderLoad: function(el) {
      el.lightGallery({
        selector: '.image-gallery .lslide'
      });
    }
  });
}
