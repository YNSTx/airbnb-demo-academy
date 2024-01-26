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

    if @lecture.available_places > 0
      @lecture.update(available_places: @lecture.available_places - 1)
      @reservation.save
      flash[:notice] = 'Reservation successful!'
    else
      flash[:alert] = 'No available places left for reservation.'
    end
    redirect_to lecture_reservations_path
  end

  def destroy
    @reservation = current_user.reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path(@lecture.reservation), notice: 'Reservation was successfully canceled.'
  end



  private

  def reservation_params
    params.require(:reservation).permit(:location)
  end
end
