Rails.application.routes.draw do
  devise_for :users
  # ルートパスへアクセスがあったらmessages_controllerのindexアクションが呼び出される
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  # どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
