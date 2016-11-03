# Preview all emails at http://localhost:3000/rails/mailers/admin_notifier
class AdminNotifierPreview < ActionMailer::Preview
  def new_admission
    @admission = Admission.last
    @admin = User.admin.first
    AdminNotifierMailer.new_admission(@admission, @admin)
  end

end
