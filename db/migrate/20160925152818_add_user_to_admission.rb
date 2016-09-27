class AddUserToAdmission < ActiveRecord::Migration[5.0]
  def change
    add_reference :admissions, :user, foreign_key: true
  end
end
