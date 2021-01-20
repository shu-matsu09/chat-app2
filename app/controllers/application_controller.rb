class ApplicationController < ActionController::Base
  # 処理が呼ばれた段階で、ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させるdeviseのメソッド
  before_action :authenticate_user!
  # メソッド名は慣習。実際は名前は何でもOK
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def configure_permitted_parameters
    # deviseにおけるparamsのようなメソッド。deviseのUserモデルにパラメーターを許可
    # :sign_upはdeviseの処理名。keysで、配列で指定された名前と同じキーを持つパラメーターの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
