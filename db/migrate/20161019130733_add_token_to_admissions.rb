class AddTokenToAdmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :admissions, :token, :string
    add_index :admissions, :token, unique: true
  end
end
