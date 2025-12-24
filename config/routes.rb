Rails.application.routes.draw do
  root "pages#home"
  resources :articals, only: [ :show, :index, :new, :create, :edit, :update ]
  resources :articals
  get "home" => "pages#home"
  get "about" => "pages#about"
  get "contact" => "pages#contact"
end
