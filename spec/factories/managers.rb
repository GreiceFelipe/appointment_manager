# frozen_string_literal: true

FactoryBot.define do
  name = Faker::Name.first_name
  password = Faker::Internet.password

  factory :manager do
    name { name }
    email { Faker::Internet.email(name: name) }
    password { password }
    password_confirmation { password }
  end
end
