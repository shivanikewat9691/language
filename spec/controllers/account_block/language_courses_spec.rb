require 'rails_helper'

RSpec.describe AccountBlock::LanguageCoursesController, type: :controller do

  GROUP_CAT = "Group Classes"
	BEGINNER_LEVEL = "Beginner Level"
	COURSE_DT = DateTime.now + 1.day
	GERMAN_30 = "Learn German in 30 days"
  LOREM_IPSUM = "Lorem Ipsum"
  before(:all) do
	 @teacher = FactoryBot.create(:teacher)
	 @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
  end

  let(:language_course_params) {{ language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1", country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: 0, language_course_level: 0, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: 0, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id}}
  let(:missing_params){{ language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: 99}}

  let(:language_course_new_params) {
    {
      "language": "English",
      "language_course_title": "Test course title",
      "language_course_study_format": "group",
      "category": "group",
      "course_duration": "12hours",
      "language_course_class_frequency": "Once a week",
      "language_course_class_time": "2023-12-13T00:00:00.000Z",
      "time": [
        {
          "id": "",
          "start_time": "11:00",
          "end_time": "11:15",
          "occurs_on": [
            "Tue"
          ]
        },
        {
          "id": 1,
          "start_time": "11:45",
          "end_time": "12:15",
          "occurs_on": [
            "Mon"
          ]
        }
      ],
      "language_level": "A1",
      "language_course_description": "description",
      "language_course_learning_results": "results"
    }
  }
  
  describe "post/create language_course" do
    it 'returns success response ' do
    	 request.headers.merge!(token: @token)
      post 'create', params: language_course_new_params
      data = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end
  end

  describe "show all coures" do
    it "should ashow all coures" do
      request.headers.merge!(token: @token)
      get :index 
      expect(response.status).to eq 200
    end
  end

=begin
  describe "update language_course" do
    it "should allow to update language_course " do
    	 @language_course = AccountBlock::LanguageCourse.create( language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
    
      request.headers.merge!(token: @token)
      put :update,  params: {id: @language_course.id, language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id} 

      expect(response.status).to eq 200
    end
  end

  describe "update language_course" do
    it "should allow to update language_course " do
       @language_course = AccountBlock::LanguageCourse.create( language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
    
      request.headers.merge!(token: @token)
      put :update,  params: {id: 9,language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id} 

      expect(response.status).to eq 200
    end
  end

  describe "show language_course details" do
    it "should show language_course details" do
    	@language_course = AccountBlock::LanguageCourse.create( language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
      request.headers.merge!(token: @token)
      get :show, params: {id: @language_course.id}
      expect(response.status).to eq 200
    end

    it "should show error No data" do
    	@language_course = AccountBlock::LanguageCourse.create(  language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1", country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
      request.headers.merge!(token: @token)
      get :show, params: {id: 0}
      expect(response.status).to eq 422
    end

    it 'deletes a language_course ' do
    	@language_course = AccountBlock::LanguageCourse.create(  language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
    	 request.headers.merge!(token: @token)
       delete 'destroy', params: {id: 0}
       expect(response).to have_http_status(404)
       expect(JSON.parse(response.body)['errors']).to eq(["Record not found"])
    end

    it 'deletes a language_course ' do
    	@language_course = AccountBlock::LanguageCourse.create(  language: "English", language_course_title:  GERMAN_30, category: GROUP_CAT, course_duration:"6hours", language_type:"Everyday", language_level:"A1",  country: "India", language_course_topic: BEGINNER_LEVEL, language_course_class_frequency: "weekly", language_course_study_format: "group", language_course_medium: :german, language_course_type: :ct_group, language_course_level: :A1, language_course_start_date: COURSE_DT, language_course_class_time: "01:00", language_course_slots: 8, language_course_total_classes: 20, language_course_status: :unstarted, language_course_occurs_on: "Mon", language_course_description: LOREM_IPSUM, language_course_learning_results: LOREM_IPSUM, teacher_id: @teacher.id)
    	 request.headers.merge!(token: @token)
       delete 'destroy', params: {id: @language_course.id}
       data = JSON.parse(response.body)
       expect(response).to have_http_status(200)
    end
  end
=end
end