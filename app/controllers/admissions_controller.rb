class AdmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, except: :new
  before_action :check_user_is_applicant
  before_action :check_admission_user, only: [:create]
  add_breadcrumb "Ana Sayfa", :root_path

  def show
  end

  def new
    @admission = Admission.new
    add_breadcrumb "Yeni Proje Başvurusu Oluşturma"
    authorize! :create,  @admission
  end

  def create
    authorize! :create,  @admission
    @admission = Admission.create(admission_params)
    redirect_to admission_build_path(:summary, admission_id: @admission.id)
  end

  def destroy
  end

  private
  def set_admission
    @admission = Admission.find(params[:id])
  end

  def admission_params
    params.require(:admission).permit(:subject)
  end

  def check_user_is_applicant
    if !current_user.applicant?
      redirect_to root_path, flash: { error: "Bu işlem için başvuran rolüne sahip olmalısınız" }
    end
  end

  def check_admission_user
    redirect_to root_path, flash: { error: "Bu başvurunun kullanıcısı siz değilsiniz" }, if: @admission.user != current_user
  end
end
