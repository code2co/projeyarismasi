class UserNotifierMailer < ApplicationMailer
  def admission_accepted(user, admission)
    @admission = admission
    @user = user
    mail( to: @user.email, subject: "Proje Başvurunuz Alındı" )
  end

  def review_assigned(user, admission, review)
    @admission = admission
    @review = review
    @user = user
    mail( to: @user.email, subject: "Özgün Proje Yarışması : Yeni Bir Projeye Hakem Olarak Atandınız" )
  end
end
