# == Schema Information
#
# Table name: reviews
#
#  id                                                     :integer          not null, primary key
#  genuine_idea__research                                 :integer
#  genuine_idea__proof                                    :integer
#  genuine_idea__processes                                :integer
#  innovativeness__target_user_expectations               :integer
#  innovavativeness__genuine                              :integer
#  innovativeness__similarity_to_other_projects           :integer
#  innovativeness__benefits_to_users                      :integer
#  innovativeness__research                               :integer
#  idea__short_history                                    :integer
#  idea__tecniques_methods                                :integer
#  idea__verification                                     :integer
#  idea__cost_cutting_techniques                          :integer
#  idea__new_tech_cost_cutting_advantages                 :integer
#  industry__market_potential                             :integer
#  industry__physibility                                  :integer
#  industry__sales_potential                              :integer
#  industry__added_value                                  :integer
#  final                                                  :boolean
#  admission_id                                           :integer
#  created_at                                             :datetime         not null
#  updated_at                                             :datetime         not null
#  user_id                                                :integer
#  comments                                               :text
#  notes_for_genuine_idea__research                       :string
#  notes_for_genuine_idea__proof                          :string
#  notes_for_genuine_idea__processes                      :string
#  notes_for_innovativeness__target_user_expectations     :string
#  notes_for_innovavativeness__genuine                    :string
#  notes_for_innovativeness__similarity_to_other_projects :string
#  notes_for_innovativeness__benefits_to_users            :string
#  notes_for_innovativeness__research                     :string
#  notes_for_idea__short_history                          :string
#  notes_for_idea__tecniques_methods                      :string
#  notes_for_idea__verification                           :string
#  notes_for_idea__cost_cutting_techniques                :string
#  notes_for_idea__new_tech_cost_cutting_advantages       :string
#  notes_for_industry__market_potential                   :string
#  notes_for_industry__physibility                        :string
#  notes_for_industry__sales_potential                    :string
#  notes_for_industry__added_value                        :string
#
# Indexes
#
#  index_reviews_on_admission_id  (admission_id)
#  index_reviews_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_74a66bd6c5  (user_id => users.id)
#

class Review < ApplicationRecord
  belongs_to :admission
  belongs_to :user
  validates :genuine_idea__research, presence: true , if: :final?
  validates :genuine_idea__proof, presence: true , if: :final?
  validates :genuine_idea__processes, presence: true , if: :final?
  validates :innovativeness__target_user_expectations, presence: true , if: :final?
  validates :innovavativeness__genuine, presence: true , if: :final?
  validates :innovativeness__similarity_to_other_projects, presence: true , if: :final?
  validates :innovativeness__benefits_to_users, presence: true , if: :final?
  validates :innovativeness__research, presence: true , if: :final?
  validates :idea__short_history, presence: true , if: :final?
  validates :idea__tecniques_methods, presence: true , if: :final?
  validates :idea__verification, presence: true , if: :final?
  validates :idea__cost_cutting_techniques, presence: true , if: :final?
  validates :idea__new_tech_cost_cutting_advantages, presence: true , if: :final?
  validates :industry__market_potential, presence: true , if: :final?
  validates :industry__physibility, presence: true , if: :final?
  validates :industry__sales_potential, presence: true , if: :final?
  validates :industry__added_value, presence: true , if: :final?
  validates :final, presence: true , if: :final?
  validates_numericality_of :genuine_idea__research, less_than_or_equal_to: 50, if: :final?
  validates_numericality_of :genuine_idea__proof, less_than_or_equal_to: 50, if: :final?
  validates_numericality_of :genuine_idea__processes, less_than_or_equal_to: 50, if: :final?
  validates_numericality_of :innovativeness__target_user_expectations, less_than_or_equal_to: 30, if: :final?
  validates_numericality_of :innovavativeness__genuine, less_than_or_equal_to: 30, if: :final?
  validates_numericality_of :innovativeness__similarity_to_other_projects, less_than_or_equal_to: 30, if: :final?
  validates_numericality_of :innovativeness__benefits_to_users, less_than_or_equal_to: 30, if: :final?
  validates_numericality_of :innovativeness__research, less_than_or_equal_to: 30, if: :final?
  validates_numericality_of :idea__short_history, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :idea__tecniques_methods, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :idea__verification, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :idea__cost_cutting_techniques, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :idea__new_tech_cost_cutting_advantages, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :industry__market_potential, less_than_or_equal_to: 40, if: :final?
  validates_numericality_of :industry__physibility, less_than_or_equal_to: 80, if: :final?
  validates_numericality_of :industry__sales_potential, less_than_or_equal_to: 40, if: :final?
  validates_numericality_of :industry__added_value, less_than_or_equal_to: 40, if: :final?

  def final?
    self.final == true
  end

  def final_score
    [self.genuine_idea__research,
    self.genuine_idea__proof,
    self.genuine_idea__processes,
    self.innovativeness__target_user_expectations,
    self.innovavativeness__genuine,
    self.innovativeness__similarity_to_other_projects,
    self.innovativeness__benefits_to_users,
    self.innovativeness__research,
    self.idea__short_history,
    self.idea__tecniques_methods,
    self.idea__verification,
    self.idea__cost_cutting_techniques,
    self.idea__new_tech_cost_cutting_advantages,
    self.industry__market_potential,
    self.industry__physibility,
    self.industry__sales_potential,
    self.industry__added_value].map(&:to_i).reduce(:+)
  end
end



