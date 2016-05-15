lock '3.4.0'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

end
