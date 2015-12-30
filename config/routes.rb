Rails.application.routes.draw do
  resources :events
  get '/import/webcatalog' => 'import#webcatalog', as: :webcatalog_import
  post '/import/webcatalog' => 'import#webcatalog_submit', as: :webcatalog_import_submit
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
