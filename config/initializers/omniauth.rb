OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '311061512378815', '9e9ceed9210884d5d0f0b2ccf4bba184'
end