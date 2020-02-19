$(function() {
  $('.left_contents__category--area').css('display', 'none');
  $('.left_contents__category--area2').css('display', 'none');
  $('.left_contents__category--area3').css('display', 'none');
  
  //「カテゴリーから探す」にマウスを乗せたら発動
  $('.left_contents__category').hover(function() {
    //マウスが乗った時の処理
    $('.left_contents__category--area').css('display', 'inline');
  }, function() {
    //マウスを話した時の処理
    $('.left_contents__category--area').css('display', 'none');
    $('.left_contents__category--area2').css('display', 'none');
    $('.left_contents__category--area3').css('display', 'none');
  });

    //「カテゴリー（左）」にマウスを乗せたら発動
    $('.left_contents__category--area--list').hover(function() {
      //マウスが乗った時の処理
      var idName = '#category-center-' + $(this).data("left");
      $('.left_contents__category--area2').css('display', 'none');
      $(idName).css('display', 'inline');
    }, function() {
      //マウスを話した時の処理
    });

    //「カテゴリー（中）」にマウスを乗せたら発動
    $('.left_contents__category--area2--list').hover(function() {
      //マウスが乗った時の処理
      var idName = '#category-right-' + $(this).data("center");
      $('.left_contents__category--area3').css('display', 'none');
      $(idName).css('display', 'inline');
    }, function() {
      //マウスを話した時の処理
    });

  //「ブランドから探す」にマウスを乗せたら発動
  $('.left_contents__brand').hover(function() {
    //マウスが乗った時の処理
    $('.left_contents__brand--area').css('display', 'inline');
  }, function() {
    //マウスを話した時の処理
    $('.left_contents__brand--area').css('display', 'none');
  });
});