class CreateAdmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :admissions do |t|
      t.string :subject
      t.text :summary
      t.text :genuine_idea__research
      t.text :genuine_idea__proof
      t.text :genuine_idea__processes
      t.text :innovativeness__target_user_expectations
      t.text :innovavativeness__genuine
      t.text :innovativeness__similarity_to_other_projects
      t.text :innovativeness__benefits_to_users
      t.text :innovativeness__research
      t.text :idea__short_history
      t.text :idea__tecniques_methods
      t.text :idea__verification
      t.text :idea__cost_cutting_techniques
      t.text :idea__new_tech_cost_cutting_advantages
      t.text :industry__market_potential
      t.text :industry__physibility
      t.text :industry__sales_potential
      t.text :industry__added_value
      t.boolean :final

      t.timestamps
    end
  end
end
