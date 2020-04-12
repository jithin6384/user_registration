Rails.application.routes.draw do
  get 'welcome/home'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'welcome#home'
 resources :users
 get 'login', to: 'users#login'
 post 'login', to: 'users#new_session'
 delete 'logout', to: 'users#destroy_session'

end
