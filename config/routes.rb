Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # ルーとパスへアクセスがあったらmessages_controllerのindexアクションが呼び出される
  root to: "messages#index"
end
