class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, except: :my_reviews

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.admission = @admission
    redirect_to admission_review_build_path(:subject_summary, admission_id: @admission.id, review_id: @review.id)
  end

  def my_reviews
    @reviews = current_user.reviews
  end

  private

  def set_admission
    @admission = Admission.find(params[:admission_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :admission_id)
  end
end
