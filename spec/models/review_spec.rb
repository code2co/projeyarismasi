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
  pending "add some examples to (or delete) #{__FILE__}"
end
