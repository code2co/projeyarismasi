class AdmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, only: :show
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

  def destroy
  end

  private
  def set_admission
    @admission = Admission.find(params[:id])
  end

  def admission_params
    params.require(:admission).permit(:subject, :user_id)
  end

  def check_user_is_applicant
    if !current_user.applicant?
      redirect_to root_path, flash: { error: "Bu işlem için başvuran rolüne sahip olmalısınız" }
    end
  end

end
