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
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function() {
    $( 'a[rel*=leanModal]').leanModal({
        top: 50,                     // モーダルウィンドウの縦位置を指定
        overlay : 0.5,               // 背面の透明度 
        closeButton: ".modal_close"  // 閉じるボタンのCSS classを指定
    });
});
 $(function() {
    $( 'a[rel*=leanModal_login]').leanModal({
        top: 50,                     // モーダルウィンドウの縦位置を指定
        overlay : 0.5,               // 背面の透明度 
        closeButton: ".modal_close"  // 閉じるボタンのCSS classを指定
    });
});
 $(function() {
    $( 'a[rel*=leanModal_lancher]').leanModal({
        top: 50,                     // モーダルウィンドウの縦位置を指定
        overlay : 0.5,               // 背面の透明度 
        closeButton: ".modal_close"  // 閉じるボタンのCSS classを指定
    });
}); 
 $(function() {
    $( 'a[rel*=leanModal_kindlancher]').leanModal({
        top: 50,                     // モーダルウィンドウの縦位置を指定
        overlay : 0.5,               // 背面の透明度 
        closeButton: ".kind_close"  // 閉じるボタンのCSS classを指定
    });
}); 