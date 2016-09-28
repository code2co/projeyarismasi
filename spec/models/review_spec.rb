# == Schema Information
#
# Table name: reviews
#
#  id                                           :integer          not null, primary key
#  genuine_idea__research                       :integer
#  genuine_idea__proof                          :integer
#  genuine_idea__processes                      :integer
#  innovativeness__target_user_expectations     :integer
#  innovavativeness__genuine                    :integer
#  innovativeness__similarity_to_other_projects :integer
#  innovativeness__benefits_to_users            :integer
#  innovativeness__research                     :integer
#  idea__short_history                          :integer
#  idea__tecniques_methods                      :integer
#  idea__verification                           :integer
#  idea__cost_cutting_techniques                :integer
#  idea__new_tech_cost_cutting_advantages       :integer
#  industry__market_potential                   :integer
#  industry__physibility                        :integer
#  industry__sales_potential                    :integer
#  industry__added_value                        :integer
#  final                                        :boolean
#  admission_id                                 :integer
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'is valid with all things in place' do
    review = create :review
    expect(review).to be_valid
  end
  
  it 'is not valid with final is true and another field is empty' do
    review = build :review, idea__verification: nil
    expect(review).not_to be_valid
  end
  
  it 'is valid when all fields are present yet final is false' do
    review = build :review, final: false
    expect(review).to be_valid
  end
  
  it 'is not valid when a sample field exceeds given max value' do
    review = build :review, idea__verification: 85
    expect(review).not_to be_valid
  end
end
