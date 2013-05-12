GurPhoto::Application.routes.draw do
  root :to => 'site#index'

  match '/page/:alias' => 'pages#show', as: :show_page
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  resources :documents do
    member do
      get :sort
    end
  end

  resources :email_templates
  resources :articles
  resources :logs
  resources :profiles, except: :index
  resources :articles
  resources :pages

  resources :users do
    post :save_hotel_search_query, on: :member
  end

  resources :site do
    get :partners, on: :collection
  end

  resources :baskets, controller: 'BasketItems' do
    get :clear, on: :collection
  end

  resources :tickets do
    get :pull, on: :member
    get :close, on: :member

    resources :messages
  end

  resources :users do
    get :print, on: :member
  end

  namespace :user do
    resources :users
    resources :moderators
    resources :agencies
    resources :hoteliers
    resources :campers
  end

  resources :hotels do
    get :print, on: :member
    get :retval, on: :member
    #resources :hotelier_hotels
  end

  namespace :hotel do
    resources :reviews
    resources :import

    resources :cities do
      get :sort, on: :member
    end

    resources :services do
      get :sort, on: :member
    end

    resources :rooms do
      get :print, on: :member
    end

    resources :filters do
      get :sort, on: :member
    end

    namespace :service do
      resources :values
    end

    namespace :filter do
      resources :values
      resources :items
    end

    namespace :room do
      resources :fields do
        get :sort, on: :member
      end

      resources :lists do
        get :sort, on: :member
      end
    end
  end
 
#  resources :hotels do
#    member do
#      get :print
#    end
#
#    resources :rooms, controller: 'Hotel::Rooms'
#    resources :special_offers, controller: 'Hotel::SpecialOffers'
#
#    resources :images, controller: 'Hotel::Images' do
#      collection do
#        post :swfupload
#        get :swfupload
#      end
#    end
#  end

  devise_scope :user do
    get '/login' => 'sessions#new'
  end
  devise_for :users, :path_prefix => 'd', controllers: { unlocks: 'unlocks', sessions: 'sessions', passwords: 'passwords' }

end
