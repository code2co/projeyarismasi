RSpec.describe UserNotifierMailer, type: :mailer do
  let(:user) { FactoryGirl.create :user, role: "applicant" }
  let(:admission) { FactoryGirl.create :admission, user: user }
  let(:mail) { UserNotifierMailer.admission_accepted(user, admission) }
  it 'renders correct mail headers' do
    expect(mail.subject).to eq "Proje Başvurunuz Alındı"
    expect(mail.to).to eq [ user.email ]
    expect(mail.from).to eq [ "bepy@emo.org.tr" ]
  end

  it 'renders the correct mail body' do
    expect(mail.body.encoded).to include 'başvurunuz kabul edildi.'
  end
end
