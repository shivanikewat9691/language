require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::GroupClassesController, type: :controller do
  routes { Rails.application.routes }


  before(:each) do
    @password = Faker::Internet.password
    @admin = AdminUser.find_or_create_by(email: Faker::Internet.email)
    @admin.password = @password
    @admin.save
    sign_in @admin
    @teacher = FactoryBot.create(:teacher)
    @language_course =  AccountBlock::LanguageCourse.create!(teacher_id: @teacher.id, language: "English", language_course_title: "english", category: "english", course_duration: "6hours", language_type: "Everyday", language_level: "A1", language_course_medium: "english", language_course_start_date: "07/09/2024", language_course_class_time: "09", language_course_occurs_on: "monday", language_course_total_classes: 25, language_course_description: "this is the course to learn", language_course_learning_results: "this is amazing course")
    @language_class = FactoryBot.create(:language_class, language_course_id: @language_course.id)
  end

  describe "create language" do
    let(:params) {{ language: "english", study_format: "medium", class_level: "average", class_type: "english",  class_plan:  "morning", class_date: "04/09/2023" ,class_time: "1:30" } }
    it "will create language" do
      post :create, params: params
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET#index' do
    it 'feTCH language_class list' do
      get :index
    expect(response.status).to eq(200)
    end
  end

  describe 'GET#show' do
    it 'show  language_class detail' do
      get :show, params: { id: @language_class.id }
      expect(response).to have_http_status(200)
    end
  end
end






