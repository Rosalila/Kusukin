Devise.setup do |config|
  config.secret_key = configus.devise.secret_key
  config.mailer_sender = configus.devise.mailer_sender

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.timeout_in = 2.hours
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth_path_prefix = '/web/omniauth'
  config.omniauth :facebook, '404645213077463', Rails.application.secrets.facebook, :image_size => {:width => 160, :height => 160}
  config.omniauth :google_oauth2, '625758491276-0meaf93ou9h0c0idjvk2hd7c6p4u9fr5.apps.googleusercontent.com', Rails.application.secrets.google_oauth2, { access_type: "offline", approval_prompt: "" }
end
