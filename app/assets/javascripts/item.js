$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<label class="filelabel" id="label-${num}">
                    <div data-index="${num}" class="js-file_group" id=js-file_group-${num}>
                      <input class="js-file" type="file"
                      name="item[images_attributes][${num}][src]"
                      id="item_images_attributes_${num}_src"><br>
                    </div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="imageArea" id="imageArea-${index}">
                    <img data-index="${index}" src="${url}" width="118px" height="118px" class="imageEdit">
                    <span class="js-remove" data-index=${index}>削除</span>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列ー
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // 1つ前のアップロードボタンエリアを非表示（display:none）にする
      $('.filelabel').css('display', 'none');
      $('.image__lower--image_text').css('display', 'none');
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    //remove対象のidを編集
    var removeGroup = "#js-file_group-" + targetIndex
    var removeArea = "#imageArea-" + targetIndex
    $(removeGroup).remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

    //自信（削除ボタンを消す
    $(this).remove();
    
    //imageAreaを消す
    $(removeArea).remove();

    targetId = '#item_images_attributes_' + targetIndex + '_id';
    $(targetId).remove();
  });

  $('#image-box-edit').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // 1つ前のアップロードボタンエリアを非表示（display:none）にする
      $('.filelabel').css('display', 'none');
      $('.image__lower--image_text').css('display', 'none');
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box-edit').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // 編集画面で新たに追加された画像を削除した場合の処理
  $('#image-box-edit').on('click', '.js-remove', function() {
    const targetIndex = $(this).data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    //remove対象のidを編集
    var removeGroup = "#js-file_group-" + targetIndex
    var removeArea = "#imageArea-" + targetIndex
    $(removeGroup).remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));

    //自信（削除ボタンを消す
    $(this).remove();
    
    //imageAreaを消す
    $(removeArea).remove();

    targetId = '#item_images_attributes_' + targetIndex + '_id';
    $(targetId).remove();
  });

  // 編集画面で新たに登録済みの画像を削除した場合の処理
  $('#image-box-edit').on('click', '.image-kizon', function(e) {
    e.preventDefault();
    const targetIndex = $(this).data('index');
    var image_id = $(this).data("imgid")
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
  
    //remove対象のidを編集
    var removeGroup = "#js-file_group-" + targetIndex
    var removeArea = "#imageArea-" + targetIndex
    $(removeGroup).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
  
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  
    //自信（削除ボタンを消す
    $(this).remove();
    
    //imageAreaを消す
    $(removeArea).remove();
  
    targetId = '#item_images_attributes_' + targetIndex + '_id';
    $(targetId).remove();
  
    $.ajax({
      // Api::ProductsControllerのimage_destroy処理（その場で画像を消す）
      type: 'DELETE',
      url: '/api/destroy/image_destroy',
      data: {img_id: image_id},
      dataType: 'json'
    })
      .done(function() {
    })
      .fail(function() {
      alert("削除に失敗しました");
    });
  });
});

$(function(){
  $('#price_calc').on('input', function(){
    var data = $('#price_calc').val(); 
    var profit = Math.round(data * 0.9)  
    var fee = (data - profit) 
    $('.right_bar').html(fee) 
    $('.right_bar').prepend('¥') 
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(profit) 
    if(profit == '') {   
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
})

