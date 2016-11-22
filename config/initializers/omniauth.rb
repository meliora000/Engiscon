OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '103754643440048', 'a244d7f464e13d5c5fd60b3258eb187e'
end