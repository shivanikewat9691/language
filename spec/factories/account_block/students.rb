FactoryBot.define do
  require 'faker'

  factory :student, class: 'AccountBlock::Student' do
    first_name { Faker::Name.first_name     }
    last_name { "Tenenbaum" }
    email { Faker::Internet.email }
    password  { "blahblah" }
    company { "Abc Ltd"}
  end
end