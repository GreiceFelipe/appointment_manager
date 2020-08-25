FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    birth_date { Faker::Date.between(from: 80.year.ago, to: Date.today) }
    cpf { "745.255.030-76" }
  end
end
