class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def room_params
    # permitの「user_ids: []」という記述は、配列に対して保存を許可したい場合、キーに対し[]を値として記述する
    params.require(:room).permit(:name, user_ids: [])
  end
end
