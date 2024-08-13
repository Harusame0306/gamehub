$(document).ready(function() {
  $('.search-link').on('click', function(event) {
    event.preventDefault();
    var imageId = $(this).data('image_id');
    $('#hidden_image_id').val(imageId);
    // 必要な処理が完了した後にリンク先にリダイレクト
    window.location.href = $(this).attr('href');
  });
});
