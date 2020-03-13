require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAZ4W6GGIIKEZJGVFC',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'bfd-image-store'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/bfd-image-store'
end