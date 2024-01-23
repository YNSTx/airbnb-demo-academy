class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = current_user
    @session = Session.find(params[:id])
  end
end
