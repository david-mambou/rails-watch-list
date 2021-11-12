Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists'
  get 'lists', to: 'lists#index', as: :lists
  get 'lists/new', to: 'lists#new', as: :new_list
  post 'lists', to: 'lists#create'
  get 'lists/:id', to: 'lists#show', as: :list

  get 'lists/:id/bookmarks', to: 'bookmarks#index', as: :list_bookmarks
  get 'lists/:id/bookmarks/new', to: 'bookmarks#new', as: :new_bookmark
  post 'lists/:id/bookmarks', to: 'bookmarks#create'

  delete 'lists/:list_id/bookmarks/:id', to: 'bookmarks#destroy', as: :delete_bookmark
end
