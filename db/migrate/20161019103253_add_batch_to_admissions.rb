class AddBatchToAdmissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :admissions, :batch, foreign_key: true, index: true
  end
end
