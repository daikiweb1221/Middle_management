Rails.application.routes.draw do
  # namespace :api do
  #   get 'password_resets/create'
  #   get 'password_resets/update'
  # end
  root to: 'home#index'

  namespace :api do
    resources :subordinates do
      resources :places, only: %i[index create destroy], shallow: true
      collection do
        get 'communications'
      end
    end
    resources :communications, only: %i[create destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :everyday_behaviors
    resources :sessions
    resources :events
    resources :users do
      collection do
        get 'me'
      end
    end
    resources :password_resets, only: %i[create update]
    resources :profile
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Active Storageでアップロードしたファイルをフロントで表示させるときに使用している
  get '*path', to: 'home#index', constraints: lambda { |req|
    # 'rails/active_storage'が含まれているパスはリダイレクト対象外にする
    req.path.exclude? 'rails/active_storage'
  }
end
