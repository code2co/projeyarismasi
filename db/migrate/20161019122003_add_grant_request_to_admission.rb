class AddGrantRequestToAdmission < ActiveRecord::Migration[5.0]
  def change
    add_column :admissions, :grant_request, :boolean, default: false
  end
end
