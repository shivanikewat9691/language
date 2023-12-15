FactoryBot.define do
  require 'faker'

  factory :teacher, class: 'AccountBlock::Teacher' do
   first_name { Faker::Name.first_name     }
    last_name { "Percival"  }
    email { Faker::Internet.email }
    password  { "blahblah" }
    time_zone {"International Date Line West"}
  end
  
end