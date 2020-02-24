$(function() {
  //sub写真にカーソルが当たったら
  $('.shosaimain__iteminfo__underimage__sub').hover(function() {
    //画像urlの取得
    var imageUrl = $(this).data('url');
    html = '<img height="300" width="300" id="mainImage" src="' + imageUrl + '">'
    console.log(imageUrl);
    // $('.shosaimain__iteminfo__image').css('src', imageUrl);
    $('#mainImage').remove();
    $('.shosaimain__iteminfo__image__main').append(html);
  });
});