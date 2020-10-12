Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'user#index'
  get 'user/account'
  post 'user/create'
  get 'user/login'
  post 'user/signin'
  get 'user/dashboard'
  get 'user/logout'
 
  get 'project/new'
  get 'project', to: 'project#new'
  post 'project/create'
  get 'project/show'
  get 'project/edit'
  patch 'project/update'
  get 'project/delete'

end
