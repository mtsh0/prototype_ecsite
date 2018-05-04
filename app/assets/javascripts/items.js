$(document).on('turbolinks:load', function(){

  //未実装1
  // 画像ファイルのプレビュー(メイン画像)
  //https://qiita.com/namitop/items/b7167b502e19d6c26d23
  $('#item_mainImage').change(function(){

    function previewFile() {
      var preview = document.querySelector('img[name="image1"]');//どこでプレビューするか指定。'img[name="preview"]'などにすればimg複数あっても指定できます。
      var file    = document.querySelector('input[type=file]').files[0];//'input[type=file]'で投稿されたファイル要素の0番目を参照します。input[type=file]にmutipleがなくてもこのコードになります。
      var reader  = new FileReader();

      reader.addEventListener("load", function () {

        // $('#image1').attr('')

        preview.src = reader.result;//めちゃめちゃ長い文字列が引き渡されます。ユーザーのファイルパスに紐付かない画像情報だと思います。
      }, false);

      if (file) {
        reader.readAsDataURL(file);//ここでreaderのメソッドに引数としてfileを入れます。ここで、readerのaddEventListenerが発火します。
      }
    }

  });

// 入力処理(商品コード)
  $('#item_itemCodeNo').on('input', function() {
      // 半角変換
      var halfVal = $(this).val().replace(/[！-～]/g,
          function (tmpStr) {
              // 文字コードをシフト
              return String.fromCharCode(tmpStr.charCodeAt(0) - 0xFEE0);
          }
      );
    // 数字以外の不要な文字を削除
    $(this).val(halfVal.replace(/[^0-9]/g, ''));
  });

// 入力処理(出荷単位)
  $('#item_shippingUnit').on('input', function() {
      // 半角変換
      var halfVal = $(this).val().replace(/[！-～]/g,
          function (tmpStr) {
              // 文字コードをシフト
              return String.fromCharCode(tmpStr.charCodeAt(0) - 0xFEE0);
          }
      );
    // 数字以外の不要な文字を削除
    $(this).val(halfVal.replace(/[^0-9]/g, ''));
  });


});
