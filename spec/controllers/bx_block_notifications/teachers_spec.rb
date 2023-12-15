require 'rails_helper'

RSpec.describe "BxBlockNotifications::TeacherNotificationsController", type: :request do

  NREQUEST_URL = '/account_block/teachers'
  REMIND_CLASS_URL = '/bx_block_notifications/class_reminder'
  CANCELED_CLASS_URL = '/bx_block_notifications/canceled_class'
  CLASS_AVAILABILITY_URL = '/bx_block_notifications/class_availability'
  ENDING_GROUP_URL = '/bx_block_notifications/ending_group_course'
  GROUP_CLASS_URL = '/bx_block_notifications/group_class'
  NEW_CLASS_URL = '/bx_block_notifications/new_class'
  TEACHER_EMAIL = 'teacher@example.com'
  CLASS_DATE = "01/07/23"
  USER_EMAIL = "user@example.com"
  NO_TEACHER_ERR = 'No teacher found with this email'

  let(:remind_class_params) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE, "class_time": "9.00 AM", "class_subject": "German"}}
  let(:canceled_class_params) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE}}
  let(:class_availability_params) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE}}
  let(:ending_group_params) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE}}
  let(:group_class) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE}}
  let(:new_class) {{"email": TEACHER_EMAIL, "class_date": CLASS_DATE}}
  let(:teacher_params) {{ "first_name": "abc", "last_name": "xyz", "email": TEACHER_EMAIL, "password": "A01@pass" } }

# Class Reminder Notification tests

context 'teacher receives Class Reminder mail' do
    it 'should not send reminder email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get REMIND_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives Class Reminding email' do
    it 'should not send reminder mail without all details' do
      post NREQUEST_URL , params: teacher_params
      get REMIND_CLASS_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Class details missing for this email')
    end
  end
  
  context 'teacher to receives Class Reminder email' do
    it 'should not send reminder email without-all details' do
      post NREQUEST_URL , params: teacher_params
      get REMIND_CLASS_URL , params: { "email": TEACHER_EMAIL, "class_date":"13/07/23"}
      expect(JSON.parse(response.body)['message']).to eq('Class details missing for this email')
    end
  end
  context 'teacher receive Class Reminder email' do
    it 'should send reminder email' do
      post NREQUEST_URL , params: teacher_params
      get REMIND_CLASS_URL , params: remind_class_params
      expect(JSON.parse(response.body)['message']).to eq('Class Reminder email sent')
    end
  end

# Class Canceled Notification tests

context 'teacher receives Cancelled Class  email' do
    it 'should not send reminder email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get CANCELED_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives Cancelled Class mail' do
    it 'should not send reminder email without all details' do
      post NREQUEST_URL , params: teacher_params
      get CANCELED_CLASS_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Canceled Class details missing')
    end
  end
 
  context 'teacher receive Cancelled Class  email' do
    it 'should send reminder email' do
      post NREQUEST_URL , params: teacher_params
      get CANCELED_CLASS_URL , params: canceled_class_params
      expect(JSON.parse(response.body)['message']).to eq('Canceled Class email sent')
    end
  end

#  Class Availability Notification tests

context 'teacher receives Class Availability  email' do
    it 'should not send Class Availability email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get CLASS_AVAILABILITY_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives Class Availability  mail' do
    it 'should not send Class Availability email without all details' do
      post NREQUEST_URL , params: teacher_params
      get CLASS_AVAILABILITY_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Class availability details missing')
    end
  end
 
  context 'teacher receive Class Availability  email' do
    it 'should send Class Availability email' do
      post NREQUEST_URL , params: teacher_params
      get CLASS_AVAILABILITY_URL , params: class_availability_params
      expect(JSON.parse(response.body)['message']).to eq('Class Availability email sent')
    end
  end

  #  Ending Group Course Notification tests

context 'teacher receives Ending Group Course  email' do
    it 'should not send Ending Group Course email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get ENDING_GROUP_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives Ending Group Course  mail' do
    it 'should not send Ending Group Course email without all details' do
      post NREQUEST_URL , params: teacher_params
      get ENDING_GROUP_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Ending group course details missing')
    end
  end
 
  context 'teacher receives Ending-Group Course  email' do
    it 'should send Ending Group Course email' do
      post NREQUEST_URL , params: teacher_params
      get ENDING_GROUP_URL , params: ending_group_params
      expect(JSON.parse(response.body)['message']).to eq('Ending group course email sent')
    end
  end

  #  Group Class Notification tests

context 'teacher receives Group Class  email' do
    it 'should not send Group Class email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get GROUP_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives Group Class  mail' do
    it 'should not send Group Class email without all details' do
      post NREQUEST_URL , params: teacher_params
      get GROUP_CLASS_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Group Class details missing')
    end
  end
 
  context 'teacher receives Group-Class  email' do
    it 'should send Group Class email' do
      post NREQUEST_URL , params: teacher_params
      get GROUP_CLASS_URL , params: ending_group_params
      expect(JSON.parse(response.body)['message']).to eq('Group Class email sent')
    end
  end

  #  New Class Notification tests

context 'teacher receives New Class  email' do
    it 'should not send New Class email for wrong email' do
      post NREQUEST_URL , params: teacher_params
      get NEW_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_TEACHER_ERR)
    end
  end
  
  context 'teacher receives New Class  mail' do
    it 'should not send New Class email without all details' do
      post NREQUEST_URL , params: teacher_params
      get NEW_CLASS_URL , params:  { "email": TEACHER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('New Class details missing')
    end
  end
 
  context 'teacher receives New-Class  email' do
    it 'should send New Class email' do
      post NREQUEST_URL , params: teacher_params
      get NEW_CLASS_URL , params: ending_group_params
      expect(JSON.parse(response.body)['message']).to eq('New Class email sent')
    end
  end

end