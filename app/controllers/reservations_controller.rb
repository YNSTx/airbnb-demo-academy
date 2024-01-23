class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @session = Session.find(params[:session_id])
    @reservation = current_user.reservations.build(session: @session)
  end

  def create
    @session = Session.find(params[:session_id])
    @reservation = current_user.reservations.new(reservation_params.merge(session: @session))

    if @reservation.save
      redirect_to session_reservations_path, notice: 'Reservation created successfully.'
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path(@session.reservation), notice: 'Reservation was successfully canceled.'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:location)
  end
end
