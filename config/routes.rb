Rails.application.routes.draw do
  root 'home#index'
  get '/о_нас', to: 'home#about_us', as: :about_us
  get '/каталог', to: 'catalogues#index', as: :katalogs
  get '/каталог/:id', to: 'catalogues#show', as: :katalog
  get '/вдохновления', to: 'inspirations#index', as: :inspirations
  get '/вдохновления/:id', to: 'inspirations#show', as: :inspiration
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
