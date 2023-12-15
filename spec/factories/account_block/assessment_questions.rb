FactoryBot.define do
  factory :assessment_question , class: 'AccountBlock::AssessmentQuestion'  do
    level { "A1" }
    question { "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam, aperiam!" }
    question_no { 3 }
    answer { "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos" }
    language { "English" }
  end
end