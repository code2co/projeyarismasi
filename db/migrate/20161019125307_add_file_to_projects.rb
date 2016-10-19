class AddFileToProjects < ActiveRecord::Migration[5.0]
  def change
    add_attachment :admissions, :file
  end
end
