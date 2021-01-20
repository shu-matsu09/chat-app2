Rails.application.routes.draw do
  get 'messages/index'
  # ルーとパスへアクセスがあったらmessages_controllerのindexアクションが呼び出される
  root to: "messages#index"
end
