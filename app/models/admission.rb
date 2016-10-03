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
#
# Indexes
#
#  index_admissions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_70fabbe2ae  (user_id => users.id)
#

class Admission < ApplicationRecord
  belongs_to :user
  has_many :reviews
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

  def final?
    self.final == true
  end

end
