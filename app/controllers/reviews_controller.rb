class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @session = Session.find(params[:session_id])
    @review = Review.new
  end

  def create
    @session = Session.find(params[:session_id])
    @review = Review.new(review_params)
    @review.session = @session

    if @review.save
      redirect_to sessions_path(@session), notice: 'Review created successfully.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
