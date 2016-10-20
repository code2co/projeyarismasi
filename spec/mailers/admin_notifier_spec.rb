require "rails_helper"

RSpec.describe AdminNotifierMailer, type: :mailer do
  let(:admission) { create :admission }
  let(:mail) { AdminNotifier.new_admission(admission) }
  it 'is sending admins email' do

  end
end
