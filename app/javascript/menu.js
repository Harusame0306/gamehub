$(document).on('turbo:load', function() {
    $('.menu-trigger').off('click').on('click', function(event) {
      $(this).toggleClass('active');
      $('#sp-menu').fadeToggle();
      event.preventDefault();
    });
  });
  