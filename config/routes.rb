Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  root to: 'pages#home'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_sh'
  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
