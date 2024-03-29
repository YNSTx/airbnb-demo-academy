class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @reservation = current_user.reservations.build(lecture: @lecture)
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.lecture = @lecture
    @reservation.user = current_user
    @reservation.save!
    if @lecture.available_places > 0
      @lecture.update(available_places: @lecture.available_places - 1)
      flash[:notice] = 'Reservation successful!'

    else
      flash[:alert] = 'No available places left for reservation.'
    end
    redirect_to reservations_path

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.lecture.update(available_places: @reservation.lecture.available_places + 1)
    @reservation.destroy
    redirect_to reservations_path, notice: 'Reservation was successfully canceled.'
  end



  private

  def reservation_params
    params.require(:reservation).permit(:location)
  end
end
