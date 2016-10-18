class AdmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, only: [ :show, :reviewer_select ]
  before_action :check_user_admin, only: [ :awaiting, :reviewer_select ]
  add_breadcrumb "Ana Sayfa", :root_path

  def show
  end

  def new
    @admission = Admission.new
    add_breadcrumb "Yeni Proje Başvurusu Oluşturma"
    authorize! :create,  @admission
  end

  def create
    @admission = Admission.create(admission_params)
    authorize! :create,  @admission
    redirect_to admission_build_path(:summary, admission_id: @admission.id)
  end

  def my
    @admissions = current_user.admissions
  end

  def awaiting
    @admissions = Admission.active.does_not_have_reviews
    @reviewed_admissions = Admission.includes(reviews: [ :user ]).has_reviews_completed.order(created_at: :desc).first(10)
  end

  def reviewer_select
    @review = Review.new
  end

  def destroy
  end

  private
  def set_admission
    @admission = Admission.find(params[:id])
  end

  def admission_params
    params.require(:admission).permit(:subject, :user_id, :bio)
  end

  def check_user_is_applicant
    if !current_user.applicant?
      redirect_to root_path, flash: { error: "Bu işlem için başvuran rolüne sahip olmalısınız" }
    end
  end

  def check_user_admin
    if !current_user.admin?
      redirect_to root_path, flash: { error: "Talep ettiğiniz sayfaya sadece yöneticiler erişebilir"}
    end
  end

end
