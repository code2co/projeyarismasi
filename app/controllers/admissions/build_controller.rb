class Admissions::BuildController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :set_admission
  before_action :check_if_final, only: [:show]
  before_action :check_due_date, only: [:show]
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
        User.admin.each do |admin|
          AdminNotifierMailer.new_admission(@admission, admin).deliver_later
        end
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
    unless current_user.admin? || current_user.reviewer?
      redirect_to root_path, flash: { error: "Bu proje başvurusu tamamlanarak onaya gönderilmiş ve düzenlenemez, lütfen sistem yöneticisi ile iletişime geçin." } if @admission.final?
    end
  end

  def check_due_date
    unless current_user.admin?
      redirect_to root_path, flash: { error: "Bu proje başvurusu için son düzenleme tarihi geçmiş" } if @admission.try(:batch).try(:due_date) < Date.today
    end
  rescue NoMethodError
    Rails.logger.error "Admission Batch is nil for Admission: #{@admission.id}"
    true
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

