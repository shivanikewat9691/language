require 'rails_helper'

RSpec.describe AccountBlock::LanguageCourse, type: :model do

	before(:all) do
	 @teacher = FactoryBot.create(:teacher)
	 @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
  end

	subject {
		described_class.new(language_course_title:  "Learn German in 30 days", language_course_topic: "Beginner level", language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: 1, language_course_type: 0, language_course_level: 0, language_course_start_date: "01/08/2023", language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: 0, language_course_occurs_on: "Mon", language_course_description: "Lorem ipsum", language_course_learning_results: "Lorem ipsum", teacher_id: @teacher.id)
	}

	it{should have_many(:language_classes).class_name("BxBlockClasses::LanguageClass")}

	it "is expected to validate that language_course title to be present" do 
		expect(should validate_presence_of(:language_course_title))
	end

	# it "is expected to validate that language_course topic to be present" do 
	# 	expect(should validate_presence_of(:language_course_topic))
	# end

	# it "is expected to validate that class frequency to be present" do 
	# 	expect(should validate_presence_of(:language_course_class_frequency))
	# end

	# it "is expected to validate that language_course study format to be present" do 
	# 	expect(should validate_presence_of(:language_course_study_format))
	# end

	#it "is expected to validate that language_course medium to be present" do 
	#	expect(should validate_presence_of(:language_course_medium))
	#end

	# it "is expected to validate that language_course type to be present" do 
	# 	expect(should validate_presence_of(:language_course_type))
	# end

	# it "is expected to validate that language_course level to be present" do 
	# 	expect(should validate_presence_of(:language_course_level))
	# end

	it "is expected to validate that language_course class time to be present" do 
		expect(should validate_presence_of(:language_course_class_time))
	end

	# it "is expected to validate that language_course slots to be present" do 
	# 	expect(should validate_presence_of(:language_course_slots))
	# end

	#it "is expected to validate that language_course total classes to be present" do 
	#	expect(should validate_presence_of(:language_course_total_classes))
	#end

	# it "is expected to validate that language_course status to be present" do 
	# 	expect(should validate_presence_of(:language_course_status))
	# end
	
	#it "is expected to validate that language_course total classes to be present" do 
	#	expect(should validate_presence_of(:language_course_total_classes))
	#end

	it "is expected to validate that language_course start date in future" do 
		subject.language_course_start_date = "25/05/2023"
	expect(subject).to_not be_valid
		
	end
	# it "is expected to validate that language_course start date in future" do 
	# 	subject.language_course_start_date = "01/01/2030"
	# expect(subject).to be_valid
	# end
end
