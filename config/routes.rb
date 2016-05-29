Rails.application.routes.draw do
  resources :buckets
  resources :comments
  resources :users
  resources :shots do
    member do
      get :comments
    end
  end

  root 'home#index'
  get 'users' => 'users#index'
  # get 'shots/:id/comments' => 'Shots#comments', :as => :shot_comments

end
