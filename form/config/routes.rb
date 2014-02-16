Form::Application.routes.draw do

  root :to => 'pages#form'

  resources :pages
end
