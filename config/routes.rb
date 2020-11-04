Rails.application.routes.draw do
  get 'register/metodoregister'
  get 'login/metodologin'
  get 'home/metodohome'
  get 'delete/metododelete'
  get 'home/index'
  get 'home', to: 'home#metodohome'
  get 'add', to: 'add#metodoadd'
  get 'modif', to: 'modif#metodomodif'
  get 'verify', to: 'verify#metodoverify'
  get 'cart', to: 'cart#metodocart'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  #match ':controller(/:action(/:id))(.:format)'
end
