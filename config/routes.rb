Rails.application.routes.draw do
  root to: "pagi#metodopagi"
  get 'register/metodoregister'
  get 'login/metodologin'
  get 'home/metodohome'
  get 'delete/metododelete'
  get 'home/index'
  get 'cart/metodocart'
  get 'home', to: 'home#metodohome'
  get 'add', to: 'add#metodoadd'
  get 'modif', to: 'modif#metodomodif'
  get 'verify', to: 'verify#metodoverify'
<<<<<<< Updated upstream
=======
  get 'pagi' , to: 'pagi#metodopagi'
  get 'data_sales' , to: 'data_sales#metodods'
  get 'report' , to: 'report#metodorep'

>>>>>>> Stashed changes
  get 'cart', to: 'cart#metodocart'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  #match ':controller(/:action(/:id))(.:format)'
end
