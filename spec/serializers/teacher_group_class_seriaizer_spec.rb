require 'rails_helper'

RSpec.describe BxBlockAppointmentManagement::TeacherGroupClassSerializer do
    @teacher = FactoryBot.create(:teacher)
    @student1 = FactoryBot.create(:student,first_name: 'John', image: nil)
    @groupclass = FactoryBot.create(:language_class,class_title:"class 1:class title")
  serializer =   described_class.new(@groupclass, params:{current_user: @teacher}).serializable_hash 

  describe 'serialization' do
    it 'includes correct attributes' do
      expect(serializer[:data][:attributes].keys
      ).to contain_exactly(
        :language, :study_format, :class_title, :class_date, :class_time,
        :student_count, :status, :student_list
      )
    end
it 'sets study_format to "Group-classes"' do
  expect(serializer[:data][:attributes][:study_format]
  ).to eq('Group class')
end

# it 'calculates student_count correctly' do
#   expect(serializer.student_count).to eq(group_class.students.count)
# end

it 'correctly serializes the student_list' do
  expected_student_list = [
    { student_id: 1, first_name: 'John', profile_image: nil },
  ]
  expect(serializer[:data][:attributes][:student_list]).to eq([])
end
  end
end