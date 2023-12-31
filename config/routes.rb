Rails.application.routes.draw do
  # root to: 'homes#top'
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
  root 'homes#top'
  get "search" => "searches#search"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :item_comments, only: [:destroy]
  end
  resources :genres, only: [:index, :create, :edit, :update,]
  resources :producing_areas, only: [:index, :create, :edit, :update,]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
end


scope module: :public do
  root to: 'homes#top'
  get '/homes/about' => "homes#about"
  resources :items, only: [:index, :show] do
    get :search, on: :collection
    get :search_name, on: :collection
    resource :favorites, only: [:create, :destroy] 
    resources :item_comments, only: [:create, :destroy]
  end
  resources :items, only: [:index, :show]
  get '/customers/information' => 'customers#show'
  get '/customers/information/edit' => 'customers#edit'
  patch '/customers/information' => 'customers#update'
  get '/customers/check' => 'customers#check'
  patch '/customers/withdraw' => 'customers#withdraw'
  get '/customers/check' => 'customers#check'
  patch '/customers/withdraw' => 'customers#withdraw'
  get '/customers/favorites' => 'customers#favorites'
    delete '/cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    patch 'cart_items' => 'cart_items#create'
    resources :cart_items, only:[:index, :update, :create, :destroy]
    resources :orders, only:[:new, :index, :show]
    post '/orders/confirm'=>'orders#confirm'
    get '/orders/thanks'=>'orders#thanks'
    post '/orders/complete'=>'orders#complete'
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :genres, only: [:show], as: "customers_genres", path: "customers/genres"
    resources :producing_areas, only: [:show], as: "customers_producingareas", path: "customers/producing_area"
  end
  
end