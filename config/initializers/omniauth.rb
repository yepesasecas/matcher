Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:facebook, 
           "765088413566293", 
           "0832ae91d443df4cfaba812849384022", 
           scope: 'email,user_birthday,read_stream', 
           display: 'popup')
end