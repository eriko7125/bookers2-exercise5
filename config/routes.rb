Rails.application.routes.draw do
  devise_for :users #これが先
  resources :users,only: [:show,:index,:edit,:update] do
    get "follow"
    get "follower"
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  # フォロー機能
  resources :relationships, only: [:create, :destroy]

  # 検索機能
  get "search" => "search#search"
  
  root 'home#top'
  get 'home/about'
end
