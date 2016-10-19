class AddCommentsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :comments, :text
  end
end
