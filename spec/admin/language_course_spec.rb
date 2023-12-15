require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers

RSpec.describe Admin::AccountBlockLanguageCoursesController, type: :controller do
  render_views
  let(:admin) { AdminUser.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
    # @image =  fixture_file_upload('german.png')
    @teacher = FactoryBot.create(:teacher)
    @student1 = FactoryBot.create(:student)
    @student2 = FactoryBot.create(:student)
    @language_course =  AccountBlock::LanguageCourse.create!(teacher_id: @teacher.id, student_ids: [@student1.id, @student2.id], language: "English", language_course_title: "english", category: "english", course_duration: "6hours", language_type: "Everyday", language_level: "A1", language_course_medium: "english", language_course_start_date: "07/09/2024", language_course_class_time: "09", language_course_occurs_on: "monday", language_course_total_classes: 25, language_course_description: "this is the course to learn", language_course_learning_results: "this is amazing course")
  end

    describe "create language course" do
      it "will create language course" do
        post :create, params: { language: @language_course}
        expect(response).to have_http_status(200)
      end
    end

    describe "get the teacher_id" do
      it "will get the  teacher_id" do
        get :index, params: { language: @language_course.teacher_id}
        expect(response).to have_http_status(200)
      end
    end

    describe "get the student_ids" do
      it "will get the  student_ids" do
        get :index, params: { language: @language_course.student_ids}
        expect(response).to have_http_status(200)
      end
    end

    describe "show lanuage courses" do
      it "will show list of language courses" do
        get :index, params: { id:  @language_course.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "show language courses" do
      it "will show language course" do
        get :show,  params: {id:  @language_course.id }
        expect(response).to have_http_status(200)
      end
    end

    describe "destroy " do
      it "will delete language courses" do
        delete :destroy, params: { id: @language_course.id }
        expect(response).to have_http_status(302)
      end
    end
end