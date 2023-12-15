FactoryBot.define do
  require 'faker'

  factory :invitee_teacher, class: 'AccountBlock::InviteeTeacher' do
   first_name { "Bob"     }
    last_name { "Perciwal"  }
    email { "invitee_teacher@example.com" }
  end
  
end