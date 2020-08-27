# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    birth_date { Faker::Date.between(from: 80.year.ago, to: Date.today) }
    cpf { "745.#{Faker::Number.number(digits: 3)}.#{Faker::Number.number(digits: 3)}-76" }
  end
end
