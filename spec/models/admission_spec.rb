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
#

require 'rails_helper'

RSpec.describe Admission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
