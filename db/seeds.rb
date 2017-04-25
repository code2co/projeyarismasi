puts 'Creating Admins'
3.times do |i|
  User.create(name: Faker::Name.name, email: "admin#{i}@code2.co", password: 'asdewq12', mobile_phone: "Faker::PhoneNumber.cell_phone", university: "asdasda", department: "asdadsasd", role: "admin", confirmed_at: Date.today )
end

puts 'Creating Reviewers'
3.times do |i|
  User.create(name: Faker::Name.name, email: "reviewer#{i}@code2.co", password: 'asdewq12', mobile_phone: "Faker::PhoneNumber.cell_phone", university: "asdasda", department: "asdadsasd", role: "reviewer", confirmed_at: Date.today)
end

puts 'Creating Applicants'
3.times do |i|
  User.create(name: Faker::Name.name, email: "applicant#{i}@code2.co", password: 'asdewq12', mobile_phone: "Faker::PhoneNumber.cell_phone", university: "asdasda", department: "asdadsasd", role: "applicant", confirmed_at: Date.today )
end

puts 'creating admissions'
10.times do |i|
  Admission.create(
    subject: Faker::Lorem.word,
    summary: Faker::Lorem.sentence,
    genuine_idea__research: Faker::Lorem.sentence,
    genuine_idea__proof: Faker::Lorem.sentence,
    genuine_idea__processes: Faker::Lorem.sentence,
    innovativeness__target_user_expectations: Faker::Lorem.sentence,
    innovavativeness__genuine: Faker::Lorem.sentence,
    innovativeness__similarity_to_other_projects: Faker::Lorem.sentence,
    innovativeness__benefits_to_users: Faker::Lorem.sentence,
    innovativeness__research: Faker::Lorem.sentence,
    idea__short_history: Faker::Lorem.sentence,
    idea__tecniques_methods: Faker::Lorem.sentence,
    idea__verification: Faker::Lorem.sentence,
    idea__cost_cutting_techniques: Faker::Lorem.sentence,
    idea__new_tech_cost_cutting_advantages: Faker::Lorem.sentence,
    industry__market_potential: Faker::Lorem.sentence,
    industry__physibility: Faker::Lorem.sentence,
    industry__sales_potential: Faker::Lorem.sentence,
    industry__added_value: Faker::Lorem.sentence,
    final: true,
    user_id: User.where(role: "applicant").order("RANDOM()").first.id,
    bio: Faker::Lorem.sentence,
    grant_request: true
  )
end

puts 'creating reviews'
Admission.all.each do |admission|
  Review.create(
    admission_id: admission.id,
    user_id: User.where(role: "reviewer").order('RANDOM()').first.id
  )
end
