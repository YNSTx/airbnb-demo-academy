class SessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def book
    @session = Session.find(params[:id])
    @reservation = current_user.reservations.build(session: @session)

    if @reservation.save
      redirect_to sessions_path, notice: 'Session booked successfully.'
    else
      redirect_to sessions_path, alert: 'Unable to book the session.'
    end
  end
end
