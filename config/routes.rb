# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin Routes
  get 'admin', to: 'admin#index'

  get 'admin/artwork', to: 'admin#artwork'
  get 'admin/pastel', to: 'admin#pastel'
  get 'admin/paintings', to: 'admin#paintings'
  get 'admin/sketches', to: 'admin#sketches'
  get 'admin/for_sale', to: 'admin#for_sale'

  # Artwork Routes
  resources :artworks, path: 'artwork'
  get 'artwork/types/pastel', to: 'artworks#pastel'
  get 'artwork/types/painting', to: 'artworks#paintings'
  get 'artwork/types/sketch', to: 'artworks#sketches'
  get 'artwork/types/for_sale', to: 'artworks#for_sale'
  get 'artwork/types/featured', to: 'artworks#featured'

  # Home Routes
  resources :home, only: :index
  get 'commissions', to: 'home#commissions'
  get 'profile', to: 'home#profile'

  root 'home#index'
end
