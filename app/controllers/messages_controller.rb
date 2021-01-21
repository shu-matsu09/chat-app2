class MessagesController < ApplicationController
  def index
    # ルーティングをネストしているため、/rooms/:room_id/messagesといったパスになっている
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在している
    @room = Room.find(params[:room_id])
    @message = Message.new
  end

  def create
    @room = Room.find(params[:room_id])
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出す
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  def message_params
    # パラメーターの中に、ログインしているuserのidと紐づいているメッセージの内容(content)を受け取れるように許可
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
