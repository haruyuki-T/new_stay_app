class RoomsController < ApplicationController

  def posts
    @rooms = Room.where(user_id: current_user.id)
  end

  def index
    @rooms = Room.all
    @rooms = @rooms.where('address LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "ルームを新規登録しました。"
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  private

  def room_params
    params.require(:room).permit(:user_id, :room_name, :room_introduction, :price, :address, :room_image)
  end

end
