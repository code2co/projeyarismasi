# == Schema Information
#
# Table name: admissions
#
#  id                                           :integer          not null, primary key
#  subject                                      :string
#  summary                                      :text
#  genuine_idea__research                       :text
#  genuine_idea__proof                          :text
#  genuine_idea__processes                      :text
#  innovativeness__target_user_expectations     :text
#  innovavativeness__genuine                    :text
#  innovativeness__similarity_to_other_projects :text
#  innovativeness__benefits_to_users            :text
#  innovativeness__research                     :text
#  idea__short_history                          :text
#  idea__tecniques_methods                      :text
#  idea__verification                           :text
#  idea__cost_cutting_techniques                :text
#  idea__new_tech_cost_cutting_advantages       :text
#  industry__market_potential                   :text
#  industry__physibility                        :text
#  industry__sales_potential                    :text
#  industry__added_value                        :text
#  final                                        :boolean
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  user_id                                      :integer
#  bio                                          :text
#  batch_id                                     :integer
#  grant_request                                :boolean          default(FALSE)
#  file_file_name                               :string
#  file_content_type                            :string
#  file_file_size                               :integer
#  file_updated_at                              :datetime
#  token                                        :string
#
# Indexes
#
#  index_admissions_on_batch_id  (batch_id)
#  index_admissions_on_token     (token) UNIQUE
#  index_admissions_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_70fabbe2ae  (user_id => users.id)
#  fk_rails_88d834636b  (batch_id => batches.id)
#

class Admission < ApplicationRecord
  scope :active, -> { where(final: true) }
  scope :does_not_have_reviews, -> { joins('LEFT JOIN reviews ON reviews.admission_id = admissions.id').where('reviews.id IS NULL') }
  scope :has_reviews_completed, -> { joins(:reviews).where("reviews.id IS NOT NULL AND reviews.final IS TRUE") }
  belongs_to :batch
  belongs_to :user
  has_many :reviews
  before_create :assign_batch
  before_create :assign_token
  validates :subject, presence: true, if: :final?
  validates :summary, presence: true, if: :final?
  validates :genuine_idea__research, presence: true, if: :final?
  validates :genuine_idea__proof, presence: true, if: :final?
  validates :genuine_idea__processes, presence: true, if: :final?
  validates :innovativeness__target_user_expectations, presence: true, if: :final?
  validates :innovavativeness__genuine, presence: true, if: :final?
  validates :innovativeness__similarity_to_other_projects, presence: true, if: :final?
  validates :innovativeness__benefits_to_users, presence: true, if: :final?
  validates :innovativeness__research, presence: true, if: :final?
  validates :idea__short_history, presence: true, if: :final?
  validates :idea__tecniques_methods, presence: true, if: :final?
  validates :idea__verification, presence: true, if: :final?
  validates :idea__cost_cutting_techniques, presence: true, if: :final?
  validates :idea__new_tech_cost_cutting_advantages, presence: true, if: :final?
  validates :industry__market_potential, presence: true, if: :final?
  validates :industry__physibility, presence: true, if: :final?
  validates :industry__sales_potential, presence: true, if: :final?
  validates :industry__added_value, presence: true, if: :final?
  validates :final, presence: true, if: :final?
  validates :bio, presence: true, if: :final?
  has_attached_file :file, styles: {thumbnail: "60x60#"}
  validates_attachment :file, content_type: { content_type: "application/pdf" }
  validates_attachment :file, size: { less_than: 3.megabytes }

  def final?
    self.final == true
  end

  def assign_token
    self.token = loop do
      random_token = SecureRandom.hex(4)
      break random_token unless Admission.exists?(token: random_token)
    end
  end

  def assign_batch
    self.batch = Batch.current
  end

end
