Rails.application.routes.draw do
  resources :todolist do 
    member do
      put 'update_status'
    end
  end
  root 'todolist#index'
end
