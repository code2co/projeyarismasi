require 'rails_helper'

RSpec.feature "Review Management", type: :feature do
  let(:reviewer) { create :user, role: "reviewer" }
  let(:applicant) { create :user, role: "applicant" }
  let(:admin) { create :user, role: "admin" }
  let(:admission) { create :admission }
  let(:review) { create :review, admission: admission, user: reviewer, final: false }

  context 'users and review roles' do
    it 'reviewers can create review' do
      login_as reviewer, scope: :user
      visit admission_review_build_path(:subject_summary, admission_id: admission.id, review_id: review.id)
      expect(page).to have_content admission.subject
      visit admission_review_build_path(:genuine_idea, admission_id: admission.id, review_id: review.id)
      fill_in "review[genuine_idea__research]", with: Faker::Number.between(10, 40)
      fill_in "review[genuine_idea__proof]", with: Faker::Number.between(10, 40)
      fill_in "review[genuine_idea__processes]", with: Faker::Number.between(10, 40)
      click_button "Kaydet >>>"
      expect(page).to have_content "Proje Özelliklerinde, Uygulama Yöntemlerinde Özgünlük, Yenilikçilik"
      expect(page).to have_content admission.innovativeness__target_user_expectations
      fill_in "review[innovativeness__target_user_expectations]", with: Faker::Number.between(10,30)
      fill_in "review[innovativeness__research]", with: Faker::Number.between(10,30)
      fill_in "review[innovativeness__benefits_to_users]", with: Faker::Number.between(10,30)
      fill_in "review[innovavativeness__genuine]", with: Faker::Number.between(10,30)
      fill_in "review[innovativeness__similarity_to_other_projects]", with: Faker::Number.between(10,30)
      click_button "Kaydet >>>"
      expect(page).to have_content "Fikrin Projeye Dönüşüm Süreci"
      expect(page).to have_content admission.idea__short_history
      fill_in "review[idea__short_history]", with: Faker::Number.between(10,40)
      fill_in "review[idea__new_tech_cost_cutting_advantages]", with: Faker::Number.between(10,40)
      fill_in "review[idea__cost_cutting_techniques]", with: Faker::Number.between(10,40)
      fill_in "review[idea__verification]", with: Faker::Number.between(10,40)
      fill_in "review[idea__tecniques_methods]", with: Faker::Number.between(10,40)
      click_button "Kaydet >>>"
      expect(page).to have_content admission.industry__added_value
      fill_in "review[industry__added_value]", with: Faker::Number.between(10,40)
      fill_in "review[industry__physibility]", with: Faker::Number.between(10,40)
      fill_in "review[industry__sales_potential]", with: Faker::Number.between(10,40)
      fill_in "review[industry__market_potential]", with: Faker::Number.between(10,40)
      click_button "Kaydet >>>"
      expect(page).to have_content "puan verdiniz"
      check "review[final]"
      click_button "Gözden geçirmeyi portala gönder"
      expect(page).to have_content "Proje değerlendirmeniz başarıyla yüklendi"
      review = Review.last
      expect(review.admission).to eq admission
    end

    it "applicants can't reach to reviews" do
      login_as applicant, scope: :user
      visit admission_review_build_path(:final, admission_id: admission.id, review_id: review.id)
      expect(page).to have_content "Bu sayfaya erişmek için izniniz yok"
    end
  end


  context 'admins can reach and manage reviews' do
    it 'admins can reach to reviews' do
      login_as admin, scope: :user
      visit admission_review_build_path(:final, admission_id: admission.id, review_id: review.id)
      expect(page).to have_content "puan verdiniz"
    end

    it 'admins can select reviewers for admissions' do
      login_as admin, scope: :user
      visit reviewer_select_admission_path(admission)
      expect(page).to have_content "Bir hakem seçin"
    end
  end

  context 'reviewers can see their reviews' do
    scenario 'reviewer has a page with his/her reviews which are not final' do
      login_as reviewer, scope: :user
      reviews = 3.times.map { create :review, admission: admission, user: reviewer, final: false }
      visit my_reviews_path
      reviews.each_with_index do |r, i|
        expect(page).to have_content reviews[i].admission.subject
      end
    end

    scenario 'my reviews page does not have completed reviews' do
      login_as reviewer, scope: :user
      finalized_review = create :review, final: true, admission: admission, user: reviewer
      visit my_reviews_path
      expect(page).not_to have_content finalized_review.admission.subject
    end
  end
end
