class Reviews::BuildController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :set_admission
  before_action :set_review
  before_action :check_if_review_final, only: :show

  steps :subject_summary, :genuine_idea, :innovativeness, :idea, :industry, :final

  def show
    authorize! :read, @review
    render_wizard
  end

  def update
    authorize! :update, @review
    if @review.update_attributes(review_params)
      if @review.final?
        redirect_to root_path, notice: "Proje değerlendirmeniz başarıyla yüklendi"
      else
        render_wizard @review
      end
    else
      render_wizard @review, alert: "Kayıt güncellenemedi"
    end
  end


  private

  def check_if_review_final
    unless current_user.admin?
      redirect_to root_path, flash: { error: "Bu proje değerlendirmesi tamanlanmış ve üzerinde değişiklik yapılamaz. Lütfen sistem yöneticisi ile iletişime geçin." } if @review.final? || @admission.batch.due_date < Date.today
    end
  end

  def set_admission
    @admission = Admission.find(params[:admission_id])
  end

  def set_review
    @review = Review.includes(:user).find(params[:review_id])
  end

  def review_params
    params.require(:review).permit(
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
      :admission_id,
      :comments
    )
  end
end

