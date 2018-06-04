# https://qiita.com/wakasa5/items/8bc831d5c3915286c876
# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_provider = 'fog/aws' #←ここを追記
#     config.fog_credentials = {
#         :provider              => 'AWS',
#         :region                => ENV['S3_REGION'],
#         :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
#         :aws_secret_access_key => ENV['S3_SECRET_KEY']
#     }
#     config.fog_directory = ENV['S3_BUCKET']
#   end
# end

# http://vdeep.net/rubyonrails-carrierwave-s3
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      # アクセスキー
      aws_access_key_id:  Rails.application.secrets.aws_access_key_id,
      # シークレットキー
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      # Tokyo
      region:  Rails.application.secrets.region
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  # 環境ごとにS3のバケットを指定
  case Rails.env
    when 'production'
      config.fog_directory = 't-ueno0207-production'
      config.asset_host = 'https://t-ueno0207-production.s3-ap-northeast-1.amazonaws.com'

    when 'development'
      config.fog_directory = 't-ueno0207'
      config.asset_host = 'https://t-ueno0207.s3-ap-northeast-1.amazonaws.com'

    when 'test'
      config.fog_directory = 'dev-sk-t.ueno-halnagoya-image-store'
      config.asset_host = 'https://dev-sk-t.ueno-halnagoya-image-store.s3-ap-northeast-1.amazonaws.com'
  end
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/