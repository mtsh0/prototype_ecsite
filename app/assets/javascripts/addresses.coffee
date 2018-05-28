# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->

#住所の自動入力

  $("#address_postalcode").jpostal({
# 郵便番号の入力欄が１つの場合
# 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
    postcode : [ "#address_postalcode" ],

# 郵便番号の入力欄が3桁-4桁で分かれている場合
# postcode : [ '#zipcode1', '#zipcode2' ]

# #user_postal_code
# #user_prefecture
# #user_city
# #user_street
# #user_others

# 入力項目フォーマット
#   %3  都道府県
#   %4  市区町村
#   %5  町域
#   %6  大口事業所の番地
#   %7  大口事業所の名称
    address  : {
      "#address_prefecture_id" : "%3", # 都道府県が入力される
      "#address_city"            : "%4%5", # 市区町村と町域が入力される(あれば)
      "#address_street"          : "%6%7" # 大口事務所の番地と名称が入力される(あれば)
    }
  })

  #ユーザー名のふりがな自動変換
  $.fn.autoKana('#address_user_name', '#address_name_kana', {
    katakana: false  #true：カタカナ、false：ひらがな（デフォルト）
  })