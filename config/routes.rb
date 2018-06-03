Rails.application.routes.draw do

  # 管理者用
  devise_for :managers, controllers: {
    sessions: 'managers/sessions',
    passwords: 'managers/passwords',
    registrations: 'managers/registrations'
  }
  resources :managers, only: [:index, :show] do
    collection do
      get 'dashboard'
    end
  end

  # ユーザー用
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:index, :show]

  # GoogleMap用
  resources :positions
  resources :addresses do
    get 'first_new', on: :collection
    post 'first_create', on: :collection
  end
  resources :contacts, except: [:edit, :update, :destroy]
  resources :genres, except: [:show]
  resources :infos, except: [:show]
  resources :items do
    get 'preview', on: :member
  end

  resources :carts, only: [:index] do
    post 'add_item', on: :collection, to: 'carts#add_item'
  end

  resources :orders, except: [:destroy] do
    post 'pay', on: :collection
  end

  # トップ画面
  resources :tops, only: [:index] do
    get 'how_to_use', on: :collection    # how_to
    get 'tops/q_and_a', on: :collection  # Q & A
    get 'contact', on: :collection       # お問い合わせ(後でcontacts#new へリンク)
    get 'company', on: :collection       # プロフィール
    get 'genre', on: :member
    get 'subgenre', on: :member
  end

  root to: 'tops#index'
end
