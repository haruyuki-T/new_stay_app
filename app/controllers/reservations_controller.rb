class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    # 親.子or（子供）.new
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      flash[:notice] = "ルームを新規予約しました。"
      redirect_to "/"
    else
      render template: 'rooms/show', status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :start_date, :end_date, :people)
  end

end
