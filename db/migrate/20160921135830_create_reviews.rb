class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :genuine_idea__research
      t.integer :genuine_idea__proof
      t.integer :genuine_idea__processes
      t.integer :innovativeness__target_user_expectations
      t.integer :innovavativeness__genuine
      t.integer :innovativeness__similarity_to_other_projects
      t.integer :innovativeness__benefits_to_users
      t.integer :innovativeness__research
      t.integer :idea__short_history
      t.integer :idea__tecniques_methods
      t.integer :idea__verification
      t.integer :idea__cost_cutting_techniques
      t.integer :idea__new_tech_cost_cutting_advantages
      t.integer :industry__market_potential
      t.integer :industry__physibility
      t.integer :industry__sales_potential
      t.integer :industry__added_value
      t.boolean :final
      t.references :admission, index: true
      t.timestamps
    end
  end
end
