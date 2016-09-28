class AdmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admission, except: [ :index, :new, :create ]
  add_breadcrumb "Ana Sayfa", :root_path
  def index
  end

  def new
    @admission = Admission.new
    add_breadcrumb "Yeni Proje Başvurusu Oluşturma"
  end

  def show
  end

  def edit
  end

  def create
    @admission = Admission.create(admission_params)
    redirect_to admission_build_path(:summary, admission_id: @admission.id)
  end

  def update
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
end
