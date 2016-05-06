Rails.application.routes.draw do
  devise_for :bloggers
  root 'welcome#index'
  get 'blogpost/single' => "blogposts#single", as: 'single'
  get 'blogpost/blogger' => "blogposts#bloggerblogposts", as: 'bloggerblogposts'
  resources :blogposts
  resources :comments
 
end
