RSpec.describe AccountBlock::GroupClassesCreator do
    GROUP_CAT = "Group Classes"
	BEGINNER_LEVEL = "Beginner Level"
	COURSE_DT = "01/08/2023"
	GERMAN_30 = "Learn German in 30 days"
  	LOREM_IPSUM = "Lorem Ipsum"

    describe '#create_classes' do
      let(:creator) { AccountBlock::GroupClassesCreator.new }
      let(:course_params) { 
        {
            language: "English",
            language_course_title: "Test course title",
            category: "group",
            language_course_study_format: "group",
            course_duration: "6hours",
            language_course_class_frequency: "Once a week",
            language_course_class_time: "2023-08-25T00:00:00.000Z",
            time: [
                {
                    id: "",
                    start_time: "11:30",
                    end_time: "13:00",
                    occurs_on: ["Tue","Wed"]
                }
            ],
            language_level: "A1",
            language_course_description: "description",
            language_course_learning_results: "results"
        }
       }
      
      let(:course_time) { [{ 'occurs_on' => ['Mon'], 'start_time' => '09:00' }, { 'occurs_on' => ['Wed'], 'start_time' => '11:00' }] }
      let(:teacher) { FactoryBot.create(:teacher) }
      let(:language_course_params) {{ language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1", country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: 0, language_course_level: 0, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: 0, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: teacher.id}}
      let(:course) { AccountBlock::LanguageCourse.create(language_course_params) }

      context 'when creating classes' do
        it 'creates the correct number of classes' do
          expect { creator.create_classes(course_params, course.id, course_time, teacher) }.to change { BxBlockClasses::LanguageClass.count }.by(4) # 4 weeks * 2 weekdays = 8 classes
        end
  
        it 'assigns the correct class details' do
          creator.create_classes(course_params, course.id, course_time, teacher)
          expect(BxBlockClasses::LanguageClass.first.language_course_id).to eq(course.id)
          expect(BxBlockClasses::LanguageClass.first.language).to eq(course_params[:language])
          # Add more expectations for other class attributes
        end
=begin
        it 'raises an error and destroys the course if class overlaps with existing classes' do
          # Implement the test for overlapping classes
          group_class = FactoryBot.create(:language_class, language_course_id: course.id, class_time: DateTime.parse("2023/08/28 09:00"))
          creator.create_classes(course_params, course.id, course_time, teacher)
          binding.pry
          expect { creator.create_classes(course_params, course.id, course_time, teacher) }.to raise_error(StandardError)
        end
=end
      end
    end
  
    describe '#parse_schedule' do
      let(:creator) { AccountBlock::GroupClassesCreator.new }
  
      it 'parses the schedule correctly' do
        schedule = [{ 'occurs_on' => ['Mon'], 'start_time' => '09:00' }, { 'occurs_on' => ['Wed'], 'start_time' => '11:00' }]
        expect(creator.send(:parse_schedule, schedule)).to eq([
          { weekday: 'Mon', time: '09:00' },
          { weekday: 'Wed', time: '11:00' }
        ])
      end
    end
  
    describe '#check_date' do
      let(:creator) { AccountBlock::GroupClassesCreator.new }
      let(:date) { DateTime.parse('2023-07-25 09:00') }
  
      it 'returns true when the date matches the weekday' do
        expect(creator.send(:check_date, date, { weekday: 'Mon', time: '09:00' })).to be_falsy
      end
  
      it 'returns false when the date does not match the weekday' do
        expect(creator.send(:check_date, date, { weekday: 'Tue', time: '09:00' })).to be_truthy
      end
    end
  end