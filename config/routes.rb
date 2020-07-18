Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'login#metodologin'

  get 'register', to: 'register#metodoregister'

  get 'home', to: 'home#metodohome'

  get 'add', to: 'add#metodoadd'

  get 'modif', to: 'modif#metodomodif'

  get 'delete', to: 'delete#metododelete'

  get 'verify', to: 'verify#metodoverify'


end
