Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  {
    scope: 'name, email',
    prompt: 'select account'
  }
end
OmniAuth.config.allowed_request_methods = %i[get post]
OmniAuth.config.full_host = Rails.env.production? ? 'http://mymarketbipasha.com:3000' : 'http://localhost:3000'
