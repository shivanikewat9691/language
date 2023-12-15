FactoryBot.define do
  
  factory :account, class: 'AccountBlock::Account' do
    first_name { "Joe" }
    last_name { "Biden" }
    email { "dennis@gmail.com" }
    password  { "blah" }
    date_of_birth  { "04/09/1995" }
    city  { "bangalore" }
    country  { "india" }
    language_taught  { "english" }
    teaching_style  { "medium" }
    personal_intrest  { "good" }
    background_of_industries  { "builder" }
    time_zone  { "india (GMT-5)" }
  end
end