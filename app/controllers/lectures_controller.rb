class LecturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
    @review = Review.new
  end

  def book
    @lecture = Lecture.find(params[:id])
    @reservation = current_user.reservations.build(Lecture: @lecture)

    if @reservation.save
      redirect_to lectures_path, notice: 'lecture booked successfully.'
    else
      redirect_to lectures_path, alert: 'Unable to book the lecture.'
    end
  end
end
