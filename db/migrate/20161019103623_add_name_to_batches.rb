class AddNameToBatches < ActiveRecord::Migration[5.0]
  def change
    add_column :batches, :name, :string
  end
end
