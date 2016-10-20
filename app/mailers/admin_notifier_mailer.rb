class AdminNotifierMailer < ApplicationMailer
  def new_admission(admission, admin)
    @admission = admission
    @admin = admin
    mail(to: @admin.email, subject: "Yeni proje başvurusu geldi")
  end
end
