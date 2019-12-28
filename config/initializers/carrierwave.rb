require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID_MER60'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_MER60'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'freemarket-sample-63d-nagoya'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarket-sample-63d-nagoya'
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end  
end
