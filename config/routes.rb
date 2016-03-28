Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'web/callbacks', registrations: 'web/registrations' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'api/v1/registrations', sessions: 'api/v1/sessions'}

      resource :progress do
        member do
          post :save
          post :status
          get :get
        end
      end

      resource :courses do
        member do
          post :save
          get :get
        end
      end

    end
  end

  scope module: :web do
    root 'home#index'

    resources :home
    resources :homework_payments
    resources :homeworks
    resources :paths
    resources :achievements
    resources :sections

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
