$(document).on('turbolinks:load', function(){

  //スライドショー
  // $(document).on('turbolinks:load', function() {
      $('.thumb-item').slick({
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: false,
          fade: true,
          asNavFor: '.thumb-item-nav',
          respondTo: 'min'
      });
      $('.thumb-item-nav').slick({
          infinite: true,
          slidesToShow: 3,
          slidesToScroll: 1,
          asNavFor: '.thumb-item',
          focusOnSelect: true,
      });

  // });

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


});
