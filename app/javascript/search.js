$(document).ready(function() {
  $('#search-link').on('click', function(event) {
    event.preventDefault();
    const keyword = prompt('ゲームタイトルを入力');
    if (keyword) {
      $.ajax({
        url: `/items/search?keyword=${keyword}`,
        method: 'GET',
        success: function(response) {
          $('#search-results').html(response);
          $('#search-results-modal').show();

          $('.search-result-image').on('click', function(event) {
            event.preventDefault(); // ページ遷移防止
            const imageUrl = $(this).attr('src');
            $('#hidden_gameurl').val(imageUrl); // hidden_fieldの値更新
            $('#displayed-image').attr('src', imageUrl); // 表示される画像更新
            $('#displayed-image').css('display', 'block'); // 画像表示
            $('#attachment-field').css('display', 'none'); // attachmentフィールド非表示
            $('#search-results-modal').hide();
          });
        }
      });
    }
  });

  $('#close-modal').on('click', function() {
    $('#search-results-modal').hide();
  });
});

