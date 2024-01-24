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
    @reservation = current_user.reservations.new(reservation_params.merge(lecture: @lecture))

    if @reservation.save
      redirect_to lecture_reservations_path, notice: 'Reservation created successfully.'
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path(@lecture.reservation), notice: 'Reservation was successfully canceled.'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:location)
  end
end
