// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.jpostal
//= require jquery.autoKana
//= require underscore
//= require gmaps/google
//= require bootstrap
//= require_tree .
//= require turbolinks



//サイドバーのアコーディオン用
$(document).on('turbolinks:load', function() {
    (function ($) {
        'use strict';
        // Collapseイベント
        $('#menu1, #menu2, #menu3, #menu4, #menu5').on({
            // 折り畳み開く処理
            'show.bs.collapse': function () {
                $('a[href="#' + this.id + '"] span.glyphicon-chevron-down')
                    .removeClass('glyphicon-chevron-down')
                    .addClass('glyphicon-chevron-up');
            },
            // 折り畳み閉じる処理
            'hide.bs.collapse': function () {
                $('a[href="#' + this.id + '"] span.glyphicon-chevron-up')
                    .removeClass('glyphicon-chevron-up')
                    .addClass('glyphicon-chevron-down');
            }
        });
        // ハッシュリンクキャンセル
        $('a[href="#menu1"], a[href="#menu2"], a[href="#menu3"], a[href="#menu4"], a[href="#menu5"]').on('click', function (event) {
            event.preventDefault();
        });
    })(jQuery);
});