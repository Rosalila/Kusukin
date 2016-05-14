require 'dragonfly'

Dragonfly.app.configure do
  plugin configus.dragonfly.plugin
  secret configus.dragonfly.secret
  url_format configus.dragonfly.url_format

  datastore :file,
  root_path: Rails.root.join('public/system/dragonfly', Rails.env),
  server_root: Rails.root.join('public')
end

Dragonfly.logger = Rails.logger
Rails.application.middleware.use Dragonfly::Middleware

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
