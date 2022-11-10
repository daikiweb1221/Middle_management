Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :subordinates
    resources :everyday_behaviors
    resources :sessions
    resources :users do
      collection do
        get 'me'
      end
    end
    resources :profile
  end
  # Active Storageでアップロードしたファイルをフロントで表示させるときに使用している
  get '*path', to: 'home#index', constraints: lambda { |req|
    # 'rails/active_storage'が含まれているパスはリダイレクト対象外にする
    req.path.exclude? 'rails/active_storage'
  }
end
