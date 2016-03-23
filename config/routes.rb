Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "web/callbacks", :registrations => "web/registrations" }

  scope module: :web do
    root 'home#index'
    post 'javascript_api/test' => 'javascript_api#test'

    post 'javascript_api/save_progress' => 'javascript_api#save_progress'
    get 'javascript_api/get_progress' => 'javascript_api#get_progress'

    resources :home
    resources :homework_payments
    resources :homeworks
    resources :paths
    resources :achievements
    resources :sections
    resources :enrollments

    resources :courses do
      collection do
        get 'in_progress'
        get 'join_enrollment'
      end
    end

    resources :categories

    resource :enrollment

    get '/backend/courses', to: 'backend#courses', as: 'backend_courses'
    get '/backend/balance', to: 'backend#balance', as: 'backend_balance'
    get '/backend/checked_assignments', to: 'backend#checked_assignments', as: 'backend_checked_assignments'
    get '/backend/pending_assignments', to: 'backend#pending_assignments', as: 'backend_pending_assignments'
    get '/profile/:id' => 'home#profile'
  end
end
