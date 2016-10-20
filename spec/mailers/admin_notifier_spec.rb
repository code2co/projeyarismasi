require "rails_helper"

RSpec.describe AdminNotifierMailer, type: :mailer do
  let(:admission) { create :admission }
  let(:admin) { create :user, role: "admin" }
  let(:mail) { AdminNotifierMailer.new_admission(admission, admin).deliver_now }
  before :each do
    ActionMailer::Base.deliveries = []
  end

  it 'is sending admins email' do
    expect(mail.to).to eq [ admin.email ]
    expect(mail.body.encoded).to include "yeni bir proje başvurusu yapıldı."
    expect(ActionMailer::Base.deliveries.last).to eq mail
  end

  it 'sends to multiple admins' do
    admins =  3.times.map { create :user, role: 'admin' }
    admins.each { |admin| AdminNotifierMailer.new_admission(admission, admin).deliver_now }
    expect(ActionMailer::Base.deliveries.count).to eq admins.count
  end
end
