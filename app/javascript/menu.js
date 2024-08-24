window.addEventListener('beforeunload', function() {
  // キャッシュを無効化
  document.querySelectorAll('link[rel="stylesheet"]').forEach(function(link) {
    link.href = link.href.split('?')[0] + '?' + new Date().getTime();
  });
});

$(document).on('turbo:load', function() {
    $('.menu-trigger').off('click').on('click', function(event) {
      $(this).toggleClass('active');
      $('#sp-menu').fadeToggle();
      event.preventDefault();
    });
  });
  