Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  # get 'devise/sessions/new'

  root 'home#index'
  # root 'devise/sessions#new'
end
