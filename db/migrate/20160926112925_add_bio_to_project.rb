class AddBioToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :admissions, :bio, :text
  end
end
