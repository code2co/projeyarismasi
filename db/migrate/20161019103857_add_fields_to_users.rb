class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :university, :string
    add_column :users, :department, :string
    add_column :users, :mobile_phone, :string
  end
end
