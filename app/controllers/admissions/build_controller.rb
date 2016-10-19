class Admissions::BuildController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :set_admission
  before_action :check_if_final, only: [:show]
  steps :subject, :summary, :genuine_idea, :innovativeness, :idea, :industry, :final

  def show
    authorize! :read, @admission
    render_wizard
  end

  def create
    @admission = current_user.admissions.build
    redirect_to wizard_path(steps.first, admission_id: @admission.id)
  end

  def update
    authorize! :update, @admission
    if @admission.update_attributes(admission_params)
      if @admission.final?
        redirect_to root_path, notice: 'Proje başvurunuz başarıyla yüklendi.'
        UserNotifierMailer.admission_accepted(current_user, @admission).deliver_later
      else
        render_wizard @admission
      end
    else
      render_wizard @admission, alert: "Kayıt Güncellenemedi"
    end
  end

  private
  def set_admission
    @admission = Admission.find(params[:admission_id])
  end

  def check_if_final
    unless current_user.admin?
      redirect_to root_path, flash: { error: "Bu proje başvurusu tamamlanarak onaya gönderilmiş ve düzenlenemez, lütfen sistem yöneticisi ile iletişime geçin." } if @admission.final? || @admission.batch.due_date < Date.today
    end
  end

  def admission_params
    params.require(:admission).permit(
      :subject,
      :summary,
      :genuine_idea__research,
      :genuine_idea__proof,
      :genuine_idea__processes,
      :innovativeness__target_user_expectations,
      :innovavativeness__genuine,
      :innovativeness__similarity_to_other_projects,
      :innovativeness__benefits_to_users,
      :innovativeness__research,
      :idea__short_history,
      :idea__tecniques_methods,
      :idea__verification,
      :idea__cost_cutting_techniques,
      :idea__new_tech_cost_cutting_advantages,
      :industry__market_potential,
      :industry__physibility,
      :industry__sales_potential,
      :industry__added_value,
      :final,
      :bio,
      :file,
      :grant_request
    )
  end
end

