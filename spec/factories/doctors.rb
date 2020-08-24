FactoryBot.define do
  uf = [
    "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO",
    "MA", "MG", "MS", "MT", "PA", "PB", "PE", "PI", "PR",
    "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"
  ]
  
  factory :doctor do
    name { Faker::Name.name }
    crm { Faker::Number.number(digits: 6) }
    crm_uf { uf.sample }
  end
end
