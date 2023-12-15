require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::AccountBlockLanguage121ClassesController, type: :controller do
  routes { Rails.application.routes }
    before(:each) do
      @password = Faker::Internet.password
      @admin = AdminUser.find_or_create_by(email: Faker::Internet.email)
      @admin.password = @password
      @admin.save
      sign_in @admin
       @student = FactoryBot.create(:student)
       @teacher = FactoryBot.create(:teacher)
       @language121_class =  AccountBlock::Language121Class.create!(student_id: @student.id, teacher_id: @teacher.id, language: "english", study_format: "1-on-1", class_level: "A2", class_type: "everyday", class_duration: 4, class_plan: "monthly", class_date: "14/10/2023", class_time: "10:00",class_weeks: 2, time_zone: "GMT")
    end
 

    let(:language121_class_params) {
    { language: "German",
    study_format: "1-to-1",
    class_level: "A1",
    class_type: "everyday",
    class_duration: 90,
    class_plan: "German_Group_A1_Daily",
    class_date: "01/07/2024",
    class_time: "11:00",
    class_weeks: 4 ,
    time_zone: "GMT",
    student_id:  @student.id,
    teacher_id: @teacher.id } }


    describe "create language 121 classes" do
      it "will create language 121 classes" do
        post :create, params: { language: language121_class_params}
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET#index' do
      it 'feTCH language121_class list' do
        get :index
        expect(response.status).to eq(200)
      end
    end
end

