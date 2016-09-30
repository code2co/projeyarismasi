require 'rails_helper'

RSpec.feature "AdmissionManagements", type: :feature do
  let (:applicant) { create :user, role: 1 }

  before :context do
    login_as :applicant, scope: :user
  end

  context 'can create admission as an applicant' do
    scenario "initializes an admission" do
      # visit root path
      # click new admission button
      # fill in steps
      # expect admissions count to be increased by 1
    end
  end
end
