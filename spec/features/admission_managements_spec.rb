require 'rails_helper'

RSpec.feature "AdmissionManagements", type: :feature do
  let (:applicant) { create :user, role: 0 }

  before :context do
    login_as :applicant, scope: :user
  end

  context 'can create admission as an applicant' do
    scenario "initializes an admission" do
      # Test 
    end
  end
end
