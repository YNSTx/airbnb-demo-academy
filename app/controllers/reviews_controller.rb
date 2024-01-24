class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @lecture = Lecture.find(params[:lecture_id])
    @review.lecture = @lecture
    @review.user = current_user

    if @review.save!
      redirect_to lectures_path(@lecture), notice: 'Review created successfully.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
