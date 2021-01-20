class UsersController < ApplicationController

  def edit
  end

  def update
    # current_userメソッドにはユーザー情報が格納されている
    if current_user.update(user_params)
      # redirect_toメソッドは新たなリクエストを送信されたときと同じで、再度ルーティング、コントローラーを経由してビューを表示する
      redirect_to root_path
    else
      # renderメソッドは新たにリクエストされることなくそのままビューを表示する
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
