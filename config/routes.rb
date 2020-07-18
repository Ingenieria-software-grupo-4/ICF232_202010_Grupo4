Rails.application.routes.draw do
  get 'verify/metodoverify'
  get 'register/metodoregister'
  get 'modif/metodomodif'
  get 'login/metodologin'
  get 'home/metodohome'
  get 'delete/metododelete'
  get 'add/metodoadd'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
