AdoptAThing::Application.routes.draw do
  devise_for :users, :controllers => {
    :passwords => 'passwords',
    :registrations => 'users',
    :sessions => 'sessions',
  }

  get 'address' => 'addresses#show', :as => 'address'
  get 'info_window' => 'info_window#index', :as => 'info_window'
  get 'sitemap' => 'sitemaps#index', :as => 'sitemap'

  scope 'sidebar', :controller => :sidebar do
    get :search, :as => 'search'
    get :combo_form, :as => 'combo_form'
    get :edit_profile, :as => 'edit_profile'
    get :stat, :as => 'stat'
  end
    
  resource :reminders, :things
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  match '/:locale' => 'main#index'
  root :to => 'main#index'
end