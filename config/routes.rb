Rails.application.routes.draw do
  
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
    scope module: :public do
      root to:"homes#top"
      get "/about" => "homes#about", as: "about"
      resources :items, only:[:index, :show]
      resources :customers do
        collection do
          get 'my_page'
          get 'information/edit', action: :edit
          patch 'information',action: :update
          get 'unsubscribe' 
          patch 'withdraw' 
          end
      end
      resources :cart_items, only:[:index, :update, :destroy, :create] do
        collection do
          delete 'destroy_all',action: :destroy_all
        end
      end
      resources :orders, only:[:new, :create, :index, :show] do
        collection do
          post 'comfirm'
          get 'complete'
        end
      end
      resources :addresses, only:[:index, :edit, :create, :update, :destroy]
   end
  
  namespace :admin do
    root to:"homes#top"
    get 'order_details/update'
    post 'admin/items' => 'create'
    resources :orders, only:[:show, :index, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :sessions, only:[:new, :create, :destroy]
  end
end