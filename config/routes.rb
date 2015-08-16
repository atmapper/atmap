Rails.application.routes.draw do
  root  'welcome#index'
  get   "welcome/data"      => "welcome#data"
  post  "login/create"      => "login#create"
  get   "login/destroy"     => "login#destroy"
  post  "map/create"        => "map#create"
  get   "map/list"          => "map#list"
  get   "map/drag"          => "map#drag"
  post  "map/clip"          => "map#clip"
  get   "map/"              => "map#index"
  post  "map/"              => "map#index"
  post  "users/create"      => "users#create"
  get   "users/start/(:id)" => "users#start"
  get   "users/"            => "users#index"
  get   "play/info"         => "play#info"
  get   "play/"             => "play#index"
end