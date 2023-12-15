require 'rails_helper'

RSpec.describe AccountBlock::StudentsController, type: :controller do
  
  SLOGIN_URL = '/bx_block_login/students'
  SREQUEST_URL = '/account_block/students'
  SRESEND_URL = '/account_block/students/resend_email'
  SREQUEST_EMAIL = 'student@example.com'
  INV_TOKEN = 'Invalid token'


  let(:student_params) {{ "first_name": "abc", "last_name": "xyz", "email": "student1@example.com", "password": "A01@pass", "company": "pixoatic" } }
  let(:invalid_params) {{ "first_name": "abc", "last_name": "def", "email": "user@example", "password": "useruser", "company": "company"} }
  let(:login_params) {{ "email": "student@example.com", "password": "password" } }
  let(:name_blank_params) {{ "first_name": "", "last_name": "kuk", "email": "user@example", "password": "useruser", "company": ""} }  
  let(:resend_params) {{"email": "student1@example.com"}}

  before do
    @student = AccountBlock::Student.create(first_name: "raj", last_name: "k", email: SREQUEST_EMAIL, password: "password", company: "Abc ltd")
    @token = BuilderJsonWebToken::JsonWebToken.encode(@student.id)
    @students = AccountBlock::Student.all
  end

  context 'create_student' do
    it 'should create a student when post request is made' do
      post :create , params: student_params
      expect(response).to have_http_status :created
    end
  end 

  context 'create_student' do
    it 'should NOT create a student when invalid email submitted' do
      post :create , params: invalid_params
      expect(response).to have_http_status :unprocessable_entity
    end
  end 

  context 'create_student' do
    it 'should NOT create a student when  name blank' do
      post :create , params: { "first_name": "", "last_name": "kuk", "email": "abc@example.com", "password": "useruser", "company": ""} 
        expect(response).to have_http_status :unprocessable_entity
    end
  end 

  context 'create_student' do
    it 'should NOT create a student when  email already exists' do
      post :create , params: student_params
      post :create , params: student_params
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  context 'student requests resend email' do
    it 'should resend email' do
      post :create , params: student_params
      get :resend_email , params: resend_params
      expect(JSON.parse(response.body)['message']).to eq('Email sent again please check')
    end
  end

  context 'student requests resend email' do
    it 'should throw error if email wrong' do
      post :create , params: student_params
      get :resend_email , params: { email: "nomail@nomail.com"}
      expect(JSON.parse(response.body)['message']).to eq('No student found with this email')
    end
  end

  describe "show student profile" do
      it "should allow to get student profile" do
        request.headers.merge!(token: @token)
        get :show, params: {id: @student}
        expect(response.status).to eq 200
      end
    end

  describe "show student profile" do
      it "should not get student profile if no student" do
        request.headers.merge!(token: @token)
        get :show, params: {id: 1000}
        expect(JSON.parse(response.body)['errors']).to  include('No data exists')
      end
    end

  describe "edit student profile" do  
    it "should allow to get edit student profile" do
      get :edit, params: {id: @student.id } 
      expect(response.status).to eq 200
    end
  end

  describe 'update student profile' do
    it 'should update student' do
      patch :update, params: {id: @student.id } 
      expect(response.status).to eq 200  
    end  
  end

  describe "Get user profile" do
    it "should allow to get profile" do
      request.headers.merge!(token: @token)
      get :index, params: {id: @student}
      expect(response.status).to eq 200
    end
  end

  describe "Get user profiles" do
    it "should allow to get all profiles" do
      request.headers.merge!(token: @token)
      get :index , params: {students: @students}
      expect(response.status).to eq 200
    end
  end

  describe "Get activate account" do
    before do
      student = create(:student)
      @token = BuilderJsonWebToken.encode(student.id, 1.year.from_now)
    end

    context "when activate account" do
      it "Your Account Is Activated" do
          get :activate_account, params: {token: @token}
          expect(response).to have_http_status(302)
      end
    end
  end

  describe "Get account names" do
    before do
      student = create(:student)
      @token = BuilderJsonWebToken.encode(student.id, 1.year.from_now)
      @token1 = BuilderJsonWebToken.encode(1000, 1.year.from_now)
    end
    context "when request names of student" do
      it "You should send names" do
        get :send_names, params: {token: @token}
        expect(response).to have_http_status(200)
      end 
    end

 end

  context "when display_language to be changed" do
    it "You should  update display_language" do
      request.headers.merge!(token: @token)
      put :set_display_language, params: {display_language: "english"}
      expect(response).to have_http_status(200)
    end 
  end
  
    context "when request student view" do
      it "You should get student view" do
        get :student_view, params: {token: @token, id: @student.id}
        expect(response).to have_http_status(200)
      end
      
      it "You should get 404 when student is not in database" do
        get :student_view, params: {token: @token, id: 999}
        expect(response).to have_http_status(404)
      end 
    end

  context "when request notification settings" do
   let(:student) {create(:student)}
      it "You should  update notification settings" do
        request.headers.merge!(token: @token)
        put :set_notifications, params: {id: student.id, student: {membership_notifn: :mn_disabled,
          booked_cls_notfn: :bc_checked,
          canceled_cls_notifn: :ca_unchecked,
          cls_reminder_notifn: :cr_disabled,
          cls_change_notifn: :cc_checked
        }}
        expect(response).to have_http_status(200)
    end 
  end

  context "when request notification settings" do
    it "You should  send notification settings" do
      get :get_notifications, params: {token: @token}
      expect(response).to have_http_status(200)
    end 
  end        

  context "when request timezone settings" do
    it "You should  send timezone settings" do
      get :get_timezone_date_time_formats, params: {token: @token}
      expect(response).to have_http_status(200)
    end 
  end


  context "when post timezone settings" do
    it "You should  set timezone settings" do
      put :set_timezone_date_time_formats, params: {token: @token}
      expect(response).to have_http_status(200)
      end 
    end
  # end

describe "Get Deactivate account" do
  context "when Deactivate account" do
    it "Your Account Is Deactivated" do
     post :create, params: student_params
     put :deactivate_account , params: student_params
     expect(JSON.parse(response.body)['message']).to include('Your Account Deactivated')
      # expect(response).to have_http_status(200)
    end
  end

  context "when Deactivate account giving wrong email" do
    it "Your Account Is Not Deactivated" do
       post :create , params: student_params
        put :deactivate_account, params: {"email": "teacher1@example.com", "password": "password"}
        expect(JSON.parse(response.body)['error']).to eq('Email or Password wrong')
    end
  end
end
end