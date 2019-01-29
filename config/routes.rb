Rails.application.routes.draw do
  resources :todolist do 
    put 'update_status'
  end
  root 'todolist#index'
end
