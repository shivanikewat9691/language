require 'rails_helper'

RSpec.describe BxBlockClasses::LanguageClassesController, type: :controller do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  GROUP_CAT = "Group Classes"
  BEGINNER_LEVEL = "Beginner Level"
  COURSE_DT = Date.today + 2.days
  GERMAN_30 = "Learn German in 30 days"
  LOREM_IPSUM = "Lorem Ipsum"

  before do
    @student = create(:student)
    @teacher = FactoryBot.create(:teacher)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
    @language_course = AccountBlock::LanguageCourse.create(language: "English", language_course_title: GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1", country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: 0, language_course_level: 0, language_course_start_date: Date.today + 2.days, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: 0, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
    @language_class = FactoryBot.create(:language_class, language_course_id: @language_course.id)
  end

  let(:language_class_params) {{ language: "German",
		study_format: "Group",
		class_level: "A1",
		class_type: "Daily",
		class_plan: "German_Group_A1_Daily",
		class_date: "01/07/2024",
		class_time: "11:00" } }
	let(:invalid_params) {{ language: "German",
		study_format: "Group",
		class_level: "A1",
		class_type: "Daily",
		class_plan: "German_Group_A1_Daily",
		class_date: "01/07/2020",
		class_time: "11:00" } }
  let(:missing_params) {{ language: "German",
		study_format: "Group",
		class_time: "11:00" } }
	let(:patch_params) {{ language: "English",
		study_format: "Group",
		class_time: "15:00" } }

=begin
  context 'create_language_class' do
    it 'should create a language_class when post request is made' do
      post :create , params: language_class_params
      expect(response).to have_http_status :created
    end
  end
=end  

	context 'get all records' do
    it 'should show the count at least 1' do
      get :index, params: {token: @token}
      expect(response).to have_http_status :ok
    end
  end 

=begin
	context 'when param missing' do
    it 'should not create class' do
      post :create , params: missing_params
      expect(response).to have_http_status :unprocessable_entity
    end
  end


	context 'when class date in past' do
    it 'should not create class' do
      post :create , params: invalid_params
      expect(response).to have_http_status :unprocessable_entity
    end
  end

	  context 'when all records are requested' do
    it 'should give count >= 1' do
     get :show, params: {id: @language_class}
      expect(response.status).to eq 200
    end
  end 
=end 
context 'when all records are requested' do
    it 'should give count >= 1' do
     get :index, params: {token: @token}
      expect(response.status).to eq 200
    end
  end 

=begin
context 'when a record is deleted' do
    it 'should show count less by 1' do
    	delete :destroy, params: {id: @language_class} 
    	  expect(response.status).to eq 204
    end
  end 
context 'when class details are modified' do 
    it 'should update with new details' do
       put :update, params: {id: @language_class}
        expect(JSON.parse(response.body)['message']).to eq('Language class Updated Successfully')
    end
  end 
context 'when class details are modified' do 
    it 'should Not update with invalid details' do
       put :update, params: {id: @language_class, class_date: "01/07/2020" }
       expect(response.status).to eq 404
        # expect(JSON.parse(response.body)['message']).to eq('Language class Updated Successfully')
    end
  end
=end
end
