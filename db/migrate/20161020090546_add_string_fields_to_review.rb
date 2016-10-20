class AddStringFieldsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :notes_for_genuine_idea__research, :string
    add_column :reviews, :notes_for_genuine_idea__proof, :string
    add_column :reviews, :notes_for_genuine_idea__processes, :string
    add_column :reviews, :notes_for_innovativeness__target_user_expectations, :string
    add_column :reviews, :notes_for_innovavativeness__genuine, :string
    add_column :reviews, :notes_for_innovativeness__similarity_to_other_projects, :string
    add_column :reviews, :notes_for_innovativeness__benefits_to_users, :string
    add_column :reviews, :notes_for_innovativeness__research, :string
    add_column :reviews, :notes_for_idea__short_history, :string
    add_column :reviews, :notes_for_idea__tecniques_methods, :string
    add_column :reviews, :notes_for_idea__verification, :string
    add_column :reviews, :notes_for_idea__cost_cutting_techniques, :string
    add_column :reviews, :notes_for_idea__new_tech_cost_cutting_advantages, :string
    add_column :reviews, :notes_for_industry__market_potential, :string
    add_column :reviews, :notes_for_industry__physibility, :string
    add_column :reviews, :notes_for_industry__sales_potential, :string
    add_column :reviews, :notes_for_industry__added_value, :string
  end
end
