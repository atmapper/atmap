Rails.application.routes.draw do
  root  'welcome#index'
  get   "welcome/start" => "welcome#start"
  get   "welcome/add"   => "welcome#add"
  get   "welcome/map"   => "welcome#map"
  get   "welcome/view"  => "welcome#view"
  post  "map/create"    => "map#create"
  get   "map/list"      => "map#list"
  get   "map/"          => "map#index"
  post  "users/create"   => "users#create"
  get   "users/"         => "users#index"
end
