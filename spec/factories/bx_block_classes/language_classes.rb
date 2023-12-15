FactoryBot.define do 
  factory :language_class, class: 'BxBlockClasses::LanguageClass' do
    language { "english" }
    study_format { "medium" }
    class_level  { "A2" }
    class_type  { "english" }
    class_plan  { "morning" }
    class_date  { "10/12/2023" }
    class_time  { "11:30" }
    language_course_id { nil }
    status { 'created' }
  end
end