Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # get '/sign_in', to: 'sessions#create'
  namespace 'api' do
    post '/sign_in', to: 'sessions#create'
    delete '/sign_out', to: 'sessions#destroy'

    resources :categories, :agencies, :agency_categories
    resources :feeds do
      collection do
        get :list_all
        get :click_report
        get :generate_click_report
      end
    end
    resources :users, only: [:create]
  end
end
