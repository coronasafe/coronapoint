Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'applications#index'

  get 'find_phone' => "contacts#find_phone"

  resources :applications, only: [:index, :show, :new, :create, :update, :edit] do
    get :summary, on: :member
    resources :houses, except: [:destroy] do
      get :confirm, on: :collection
    end
    resources :vehicles, except: [:destroy] do
    end
    resources :contacts, except: [:destroy] do
      get :summary, on: :member
    end
  end
end
