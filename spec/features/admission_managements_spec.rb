require 'rails_helper'

RSpec.feature "User can add/edit admissions", type: :feature do
  let (:applicant) { create :user, role: 0 }
  let(:batch) { create :batch }
  let(:reviewer) { create :user, role: "reviewer" }

  before :example do
    login_as applicant, scope: :user
  end

  context 'with fully correct admission' do
    it 'can create admission' do
      visit new_admission_path
      fill_in "admission[subject]", with: Faker::Lorem.sentence
      fill_in "admission[bio]", with: Faker::Lorem.paragraph
      click_button "Proje Başvurusuna Başla"
      expect(page).to have_content "Projenin Kısa Özeti"
      fill_in "admission[summary]", with: Faker::Lorem.paragraph
      click_button "Sonraki Adıma Geç"
      expect(page).to have_content "Projede özgün ve yenilikçilik adına yapılan araştırmalar"
      fill_in "admission[genuine_idea__research]", with: Faker::Lorem.sentence
      fill_in "admission[genuine_idea__proof]", with: Faker::Lorem.sentence
      fill_in "admission[genuine_idea__processes]", with: Faker::Lorem.sentence
      click_button "Sonraki Adıma Geç"
      expect(page).to have_content "Proje konusu ürün tasarımının özgünlüğü"
      fill_in "admission[innovativeness__target_user_expectations]", with: Faker::Lorem.sentence
      fill_in "admission[innovavativeness__genuine]", with: Faker::Lorem.sentence
      fill_in "admission[innovativeness__similarity_to_other_projects]", with: Faker::Lorem.sentence
      fill_in "admission[innovativeness__benefits_to_users]", with: Faker::Lorem.sentence
      fill_in "admission[innovativeness__research]", with: Faker::Lorem.sentence
      click_button "Sonraki Adıma Geç"
      expect(page).to have_content "Proje konusu ürünü"
      fill_in "admission[idea__short_history]", with: "Utku Kaynar"
      fill_in "admission[idea__tecniques_methods]", with: Faker::Lorem.sentence
      fill_in "admission[idea__verification]", with: Faker::Lorem.sentence
      fill_in "admission[idea__cost_cutting_techniques]", with: Faker::Lorem.sentence
      fill_in "admission[idea__new_tech_cost_cutting_advantages]", with: Faker::Lorem.sentence
      click_button "Sonraki Adıma Geç"
      expect(page).to have_content "Projedeki özgün ve yaratıcı fikirlerin"
      fill_in "admission[industry__market_potential]", with: Faker::Lorem.sentence
      fill_in "admission[industry__sales_potential]", with: Faker::Lorem.sentence
      fill_in "admission[industry__physibility]", with: Faker::Lorem.sentence
      fill_in "admission[industry__added_value]", with: Faker::Lorem.sentence
      click_button "Sonraki Adıma Geç"
      expect(page).to have_content "Proje Başvurusu Tamamlanıyor"
      check "admission[final]"
      click_button "Projeyi Tamamla ve Gözden Geçirmeye Gönder"
      expect(page).to have_content "Proje başvurunuz başarıyla yüklendi"
      admission = Admission.last
      admission.batch = batch
      admission.save
      expect(admission.idea__short_history).to eq "Utku Kaynar"
    end
  end

  context 'controls on user roles' do
    it 'reviewers cannot apply to admissions' do
      login_as reviewer, scope: :user
      visit new_admission_path
      expect(page).to have_content "Bu sayfaya erişmek için izniniz yok"
    end
  end
end
