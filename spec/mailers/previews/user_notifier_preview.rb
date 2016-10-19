# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  def admission_accepted
    @admission = Admission.last
    @user = User.first
    UserNotifierMailer.admission_accepted(@user, @admission)
  end

  def review_assigned
    @user = User.first
    @review = Review.last
    @admission = @review.admission
    UserNotifierMailer.review_assigned(@user, @admission, @review)
  end

end
