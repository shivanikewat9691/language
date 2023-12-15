require 'rails_helper'

RSpec.describe "BxBlockNotifications::StudentNotificationsController", type: :request do

  NSREQUEST_URL = '/account_block/students'

  SREMIND_CLASS_URL = '/bx_block_notifications/student_class_reminder'
  MEMBERSHIP_URL = '/bx_block_notifications/student_membership'
  BOOKED_CLASS_URL = '/bx_block_notifications/student_booked_class_confirmation'
  SCANCELED_CLASS_URL = '/bx_block_notifications/student_canceled_class'
  CLASS_CHANGES_URL = '/bx_block_notifications/student_class_changes'

  STUDENT_EMAIL = 'student@example.com'
  CLASS_DATE = "01/07/23"
  USER_EMAIL = "user@example.com"
  NO_STUDENT_ERR = 'No student found with this email'

  CLASS_DETAILS_MISSING = 'Class Details Missing'

  let(:remind_class_params) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  let(:membership_params) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  let(:booked_class_params) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  let(:canceled_class_params) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  let(:changed_class_params) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  # let(:new_class) {{"email": STUDENT_EMAIL, "class_date": CLASS_DATE}}
  let(:student_params) {{ "first_name": "abc", "last_name": "xyz", "email": STUDENT_EMAIL, "password": "A01@pass" } }

# Class Reminder Notification tests

context 'student receives Class Reminder mail' do
    it 'should not send reminder email for wrong email' do
      post NSREQUEST_URL , params: student_params
      get SREMIND_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_STUDENT_ERR)
    end
  end
  
  context 'student receives Class Reminding email' do
    it 'should not send reminder mail without all details' do
      post NSREQUEST_URL , params: student_params
      get SREMIND_CLASS_URL , params:  { "email": STUDENT_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(CLASS_DETAILS_MISSING)
    end
  end
  
  context 'student to receives Class Reminder email' do
    it 'should not send reminder email without-all details' do
      post NSREQUEST_URL , params: student_params
      get SREMIND_CLASS_URL , params: { "email": STUDENT_EMAIL, "class_date":"13/07/23"}
      expect(JSON.parse(response.body)['message']).to eq('Class Reminder email sent')
    end
  end
  context 'student receive Class Reminder email' do
    it 'should send reminder email' do
      post NSREQUEST_URL , params: student_params
      get SREMIND_CLASS_URL , params: remind_class_params
      expect(JSON.parse(response.body)['message']).to eq('Class Reminder email sent')
    end
  end

  #  Student Membership Notification tests

context 'student Membership' do
    it 'should not send Membership email' do
      post NSREQUEST_URL , params: student_params
      get MEMBERSHIP_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_STUDENT_ERR)
    end
  end
  
   
  context 'student Membership' do
    it 'should send Membership email' do
      post NSREQUEST_URL , params: student_params
      get MEMBERSHIP_URL , params: membership_params
      expect(JSON.parse(response.body)['message']).to eq('Membership email sent')
    end
  end

  #   Booked Class Notification tests

context 'student receives Booked Class  email' do
    it 'should not send Booked Class email for wrong email' do
      post NSREQUEST_URL , params: student_params
      get BOOKED_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_STUDENT_ERR)
    end
  end
  
  context 'student receives Booked Class  mail' do
    it 'should not send New Class email without all details' do
      post NSREQUEST_URL , params: student_params
      get BOOKED_CLASS_URL , params:  { "email": STUDENT_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(CLASS_DETAILS_MISSING)
    end
  end
 
  context 'student receives Booked Class  email' do
    it 'should send Booked Class email' do
      post NSREQUEST_URL , params: student_params
      get BOOKED_CLASS_URL , params: booked_class_params
      expect(JSON.parse(response.body)['message']).to eq('Booked Class email sent')
    end
  end




# Class Canceled Notification tests

context 'student receives Cancelled Class  email' do
    it 'should not send reminder email for wrong email' do
      post NSREQUEST_URL , params: student_params
      get SCANCELED_CLASS_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_STUDENT_ERR)
    end
  end
  
  context 'student receives Cancelled Class mail' do
    it 'should not send reminder email without all details' do
      post NSREQUEST_URL , params: student_params
      get SCANCELED_CLASS_URL , params:  { "email": STUDENT_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq('Canceled Class details missing')
    end
  end
 
  context 'student receive Cancelled Class  email' do
    it 'should send reminder email' do
      post NSREQUEST_URL , params: student_params
      get SCANCELED_CLASS_URL , params: {student:STUDENT_EMAIL,class_date:CLASS_DATE,message_description:"description given by teacher"}
      expect(JSON.parse(response.body)['message']).to eq('No student found with this email')
    end
  end

# #  Class Changes Notification tests

context 'student receives Class Changes  email' do
    it 'should not send Class Changes email for wrong email' do
      post NSREQUEST_URL , params: student_params
      get CLASS_CHANGES_URL , params: { "email": USER_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(NO_STUDENT_ERR)
    end
  end
  
  context 'student receives Class Changes  mail' do
    it 'should not send Class Changes email without all details' do
      post NSREQUEST_URL , params: student_params
      get CLASS_CHANGES_URL , params:  { "email": STUDENT_EMAIL}
      expect(JSON.parse(response.body)['message']).to eq(CLASS_DETAILS_MISSING)
    end
  end
 
  context 'student receive Class Changes  email' do
    it 'should send Class Changes email' do
      post NSREQUEST_URL , params: student_params
      get CLASS_CHANGES_URL , params: changed_class_params
      expect(JSON.parse(response.body)['message']).to eq('Class Changes email sent')
    end
  end



end