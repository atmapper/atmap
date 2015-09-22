Rails.application.routes.draw do
  root  'welcome#index'
  get   "welcome/data"      => "welcome#data"

  post  "login/create"      => "login#create"
  get   "login/destroy"     => "login#destroy"

  post  "map/create"        => "map#create"
  get   "map/list"          => "map#list"
  get   "map/drag"          => "map#drag"
  post  "map/clip"          => "map#clip"
  get   "map/clipcnt/(:id)" => "map#one"
  get   "map/"              => "map#index"
  get   "map/keysearch"     => "map#keysearch"
  get   "map/locsearch"     => "map#locsearch"
  get   "map/(:id)"         => "map#view"

  post  "users/create"      => "users#create"
  get   "users/start/(:id)" => "users#start"
  get   "users/"            => "users#index"

  get   "play/info"         => "play#info"
  get   "play/allinfo"      => "play#allinfo"
  get   "play/"             => "play#index"

  get   "comment/index"     => "comment#index"
  get   "comment/(:id)"     => "comment#comlist"
  post  "comment/create"    => "comment#create"

  get   "use/index"         => "use#index"
  get   "use/(:id)"         => "use#one"
  post  "use/create"        => "use#create"

  get   "search/index"      => "search#index"
  get   "search/(:id)"      => "search#one"
end