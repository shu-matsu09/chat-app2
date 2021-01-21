class MessagesController < ApplicationController
  def index
    # ルーティングをネストしているため、/rooms/:room_id/messagesといったパスになっている
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在している
    @room = Room.find(params[:room_id])
    @message = Message.new
    # チャットルームに紐付いている全てのメッセージを@messageと定義。メッセージに紐付くユーザー情報の取得に、
    # メッセージの数と同じ回数のアクセスが必要なため、includes(:user)とすることでN+1問題を解消
    @messages = @room.messages.includes(:room)
  end

  def create
    @room = Room.find(params[:room_id])
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンス(messagesテーブルだからmessages)を生成し、message_paramsを引数にして、privateメソッドを呼び出す
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      # 投稿に失敗したときにindex.html.erbを参照するが、renderではindexアクションを経由しないため、@messagesが定義されていないとエラーになる。そのため、indexアクションと同様に@messageを定義する必要あり
      @messages = @room.messages.includes(:room)
      render :index
    end
  end

  private
  def message_params
    # パラメーターの中に、ログインしているuserのidと紐づいているメッセージの内容(content)を受け取れるように許可
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
