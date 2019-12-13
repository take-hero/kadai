if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_KEY_ID'],
      region: 'us-east-2'
    }
    config.fog_directory = 'takehiro-bakket'
  end
end