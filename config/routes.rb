Rails.application.routes.draw do
  resources :chats

  resources :users do

    resources :messages do
      collection do
        get :get_unreaded
        get :get_archive
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
