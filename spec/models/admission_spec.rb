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
  it 'is valid with all things in place' do
    admission = create :admission
    expect(admission).to be_valid
  end

  it "is not valid without industry sales potential, yet final is true" do
    admission = build :admission, industry__sales_potential: nil
    expect(admission).not_to be_valid
  end

  it 'is valid when final is false' do
    admission = build :admission, final: false
    expect(admission).to be_valid
  end

  context 'if_final' do
    before { allow(subject).to receive(:final?).and_return true }
    it { should validate_presence_of(:subject                                      )}
    it { should validate_presence_of(:summary                                      )}
    it { should validate_presence_of(:genuine_idea__research                       )}
    it { should validate_presence_of(:genuine_idea__proof                          )}
    it { should validate_presence_of(:genuine_idea__processes                      )}
    it { should validate_presence_of(:innovativeness__target_user_expectations     )}
    it { should validate_presence_of(:innovavativeness__genuine                    )}
    it { should validate_presence_of(:innovativeness__similarity_to_other_projects )}
    it { should validate_presence_of(:innovativeness__benefits_to_users            )}
    it { should validate_presence_of(:innovativeness__research                     )}
    it { should validate_presence_of(:idea__short_history                          )}
    it { should validate_presence_of(:idea__tecniques_methods                      )}
    it { should validate_presence_of(:idea__verification                           )}
    it { should validate_presence_of(:idea__cost_cutting_techniques                )}
    it { should validate_presence_of(:idea__new_tech_cost_cutting_advantages       )}
    it { should validate_presence_of(:industry__market_potential                   )}
    it { should validate_presence_of(:industry__physibility                        )}
    it { should validate_presence_of(:industry__sales_potential                    )}
    it { should validate_presence_of(:industry__added_value                        )}
    it { should validate_presence_of(:final                                        )}
    it { should validate_presence_of(:bio                                          )}
  end
end


