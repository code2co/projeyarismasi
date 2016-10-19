FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "12345678"
    confirmed_at Time.now
    name { Faker::Name.name}
  end

  factory :review do
    admission
    genuine_idea__research 49
    genuine_idea__proof 49
    genuine_idea__processes 49
    innovativeness__target_user_expectations 20
    innovavativeness__genuine 20
    innovativeness__similarity_to_other_projects 20
    innovativeness__benefits_to_users 20
    innovativeness__research 20
    idea__short_history 79
    idea__tecniques_methods 79
    idea__verification 79
    idea__cost_cutting_techniques 79
    idea__new_tech_cost_cutting_advantages 79
    industry__market_potential 40
    industry__physibility 80
    industry__sales_potential 40
    industry__added_value 40
    final true
  end

  factory :admission do
    subject { Faker::Lorem.sentence }
    summary { Faker::Lorem.paragraph }
    genuine_idea__research { Faker::Lorem.paragraph }
    genuine_idea__proof { Faker::Lorem.paragraph }
    genuine_idea__processes { Faker::Lorem.paragraph(3) }
    innovativeness__target_user_expectations { Faker::Lorem.paragraph }
    innovavativeness__genuine { Faker::Lorem.paragraph }
    innovativeness__similarity_to_other_projects { Faker::Lorem.paragraph }
    innovativeness__benefits_to_users { Faker::Lorem.paragraph }
    innovativeness__research { Faker::Lorem.paragraph }
    idea__short_history { Faker::Lorem.paragraph }
    idea__tecniques_methods { Faker::Lorem.paragraph }
    idea__verification { Faker::Lorem.paragraph }
    idea__cost_cutting_techniques { Faker::Lorem.paragraph }
    idea__new_tech_cost_cutting_advantages { Faker::Lorem.paragraph }
    industry__market_potential { Faker::Lorem.paragraph }
    industry__physibility { Faker::Lorem.paragraph }
    industry__sales_potential { Faker::Lorem.paragraph }
    industry__added_value { Faker::Lorem.paragraph }
    bio { Faker::Lorem.paragraph }
    final true
  end
end

