Rails.application.routes.draw do
  root 'welcome#index'
  get  "welcome/start" => "welcome#start"
  get  "welcome/add"   => "welcome#add"
  get  "welcome/map"   => "welcome#map"
  get  "welcome/view"  => "welcome#view"
end
