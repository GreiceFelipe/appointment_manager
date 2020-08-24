# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    crm { Faker::Number.number(digits: 6) }
    crm_uf { 'RJ' }
  end
end
