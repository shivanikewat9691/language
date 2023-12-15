FactoryBot.define do
  require 'faker'

  factory :invitee_student, class: 'AccountBlock::InviteeStudent' do
   first_name { "Robert"     }
    last_name { "Ludlum"  }
    email { "student@example.com" }
  end
  
end