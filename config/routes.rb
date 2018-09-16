Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'add', to: 'url_shorteners#add'

  get '/:short_url', to: 'url_shorteners#redirect'

  root to: 'url_shorteners#index'
end
