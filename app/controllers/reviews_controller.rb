class ReviewsController < ApplicationController
  before_action :set_admission

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.admission = @admission
    redirect_to admission_review_build_path(:subject_summary, admission_id: @admission.id, review_id: @review.id)
  end

  private

  def set_admission
    @admission = Admission.find(params[:admission_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :admission_id)
  end
end
