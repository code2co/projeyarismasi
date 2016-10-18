class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, except: :my_reviews

  def new
    @review = Review.new
  end

  def create
    params["review"].each do |review|
      if review["user_id"].to_i != 0
        @review = Review.create(user_id: review["user_id"].to_i, admission_id: @admission.id)
      end
    end
    redirect_to root_path, notice: "Tüm gözden geçirmeler oluşturuldu ve hakemlere e-posta gönderildi"
  end

  def my_reviews
    @reviews = current_user.reviews.includes(:admission)
  end

  private

  def set_admission
    @admission = Admission.find(params[:admission_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :admission_id)
  end
end
