require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'user forms has correct fields' do
    visit new_user_registration_path
    expect(page).to have_content "E-Posta"
    expect(page).to have_content "Parola"
    expect(page).to have_content "Üniversitenizi Seçin"
    expect(page).to have_content "Bölüm Seçimi"
    expect(page).to have_content "Cep Telefonu"
  end
end
