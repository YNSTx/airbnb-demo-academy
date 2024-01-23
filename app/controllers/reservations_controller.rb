class ReservationsController < ApplicationController
def index
  @reservations = Reservation.all
end

def show
  @reservation = Reservation.find(params[:id])
end

def new
  @reservation = Reservation.new
  @session = Session.find_by(id: params[:id])
end

def create
  @reservation = Reservation.new
  @reservation.session_id = params[:session_id]
  @reservation.user_id = current_user.id
  if @reservation.save!
    redirect_to reservations_path
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
end

private

def reservation_params
  params.require(:reservation).permit()
end
end
