FactoryBot.define do
	# require 'faker'
  factory :language121_class,class: 'AccountBlock::Language121Class' do
    language { "english" }
    study_format { "1-on-1" }
    class_level  { "A2" }
    class_type  { "english" }
    class_plan  { "everyday" }
    class_duration { 4 }
    class_weeks { 2 }
    class_date  { "04/09/2023" }
    class_time  { "1:30" }
  end
end
