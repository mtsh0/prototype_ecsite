ruby '2.3.5'

source 'https://rubygems.org'
gem 'rails', '~> 4.2.5'
# mysqlを使えるようにする
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby
# jqueryを使えるようにする
gem 'jquery-rails'
# ページ遷移をAjaxに置き換え、JavaScriptやCSSのパースを省略することで高速化する
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'autonumeric-rails'
# bootstrap(sass用、not 本体)
gem 'bootstrap-sass'
# 画像アップロード用
gem 'carrierwave'
#
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
# googlemap利用用
gem 'gmaps4rails'
# jqueryのターボリンク設定
gem 'jquery-turbolinks'
# ページネーションが使えるようになる
gem 'kaminari'
# 画像編集用
gem 'mini_magick'
# 決済用ライブラリ
gem 'payjp'
# メール画面のレイアウトの詳細設定
gem 'premailer-rails'
# 検索用
gem 'ransack'
# 肥大したマイグレーションファイルをまとめてくれる(扱い注意)
gem 'squasher'


# gem 'sass-rails', '>= 3.2'
# gem 'bootstrap-sass', '~> 3.3.6'

#検討中
# gem 'autonumeric-rails'
# gem 'breadcrumbs_on_rails'
# gem 'devise_masquerade'
# gem 'kakurenbo_puti'
# gem 'gretel'
# gem 'rack-user_agent'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # schemaなどを各モデルで表示してくれる
  gem 'annotate'
  # 開発環境でメール送受信の確認ができる
  gem 'letter_opener_web'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'hirb'
  gem 'hirb-unicode'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # rubyの静的分析ライブラリ
  gem 'rubocop', require: false
  # 開発環境の
  gem 'spring'
  # render先の表示
  gem 'view_source_map'
end


group :production do
  gem 'rails_12factor'
end
