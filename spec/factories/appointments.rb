FactoryBot.define do
  factory :appointment do
    starts_at { Time.new(2015, 8, 1, 10, 0, 0) }
    patient { create(:patient) }
    doctor { create(:doctor) }
  end
end
