require 'rails_helper'

RSpec.describe BxBlockAppointmentManagement::TeacherController, type: :controller do

  describe 'Appointment Managment of Teacher' do
    TIMEZONE = "International Date Line West"
    STUDYFORMAT = "1-on-1"
   
    before do
      @teacher = FactoryBot.create(:teacher)
      @student = FactoryBot.create(:student)
      @token = BuilderJsonWebToken::JsonWebToken.encode(@teacher.id)
    end
    

    context 'previous classes' do 
      
      it 'return previous  classes' do
        language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today-2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
        request.headers.merge!(token: @token)
        get :previous_classes_one_to_one
        expect(response).to have_http_status(:success)
      end
      it 'return empty classes' do
        language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,status:'created',class_weeks:3,class_plan:"premium",class_date:Date.today-2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
        group_classes=nil
        request.headers.merge!(token: @token)
        get :previous_classes_one_to_one
        expect(JSON.parse(response.body).first["data"]
          ).to eq([])
        expect(JSON.parse(response.body).second["data"]
          ).to eq([])
        expect(response).to have_http_status(:success)
      end
    end

    context 'Upcoming one to one classes' do 
      
      it 'return upcoming one to one classes' do
        language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
        request.headers.merge!(token: @token)
        get :upcoming_classes_one_to_one
        expect(response).to have_http_status(:success)
      end
      it 'return upcoming one to one classes from specific date' do
        language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
        request.headers.merge!(token: @token)
        get :upcoming_classes_one_to_one,params: {startdate:Date.today,enddate:Date.today+5.days}
        expect(response).to have_http_status(:success)
      end
    end

    context 'Requested one to one classes' do 
      
      it 'return requested one to one classes' do
        language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
        request.headers.merge!(token: @token)
        get :requested_one_to_one_class
        expect(response).to have_http_status(:success)
      end

      it 'return no requested one to one classes' do
        request.headers.merge!(token: @token)
        get :requested_one_to_one_class
        expect(JSON.parse(response.body)).to eq({})
      end
    end

      
    it 'accept one to one classes' do
      language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
      request.headers.merge!(token: @token)
      post :accept_one_to_one_class, params: {id: language121.id}
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["message"]).to eq('Class has been accepted')
    end

    it 'reject one to one classes' do
      language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
      request.headers.merge!(token: @token)
      message = "\"reject msg from teacher\""
      post :reject_one_to_one_class, params: {id: language121.id,reject_description: message}
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["message"]).to eq('Class has been rejected')
    end

    it 'cancel one to one classes' do
      language121=AccountBlock::Language121Class.create(language:"Maths",study_format:STUDYFORMAT,class_level:"A1",class_type:"aaa",class_duration:6,class_weeks:3,class_plan:"premium",class_date:Date.today+2.days,class_time:Time.now,time_zone:TIMEZONE,student_id:@student.id,teacher_id:@teacher.id)
      request.headers.merge!(token: @token)
      message = "\"cancel msg from teacher\""
      post :cancel_one_to_one_class, params: {id: language121.id,cancel_description: message}
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["message"]).to eq("Class has been cancelled")
    end
  end	
end
