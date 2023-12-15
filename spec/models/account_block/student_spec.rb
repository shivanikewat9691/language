require 'rails_helper'
require 'faker'

RSpec.describe AccountBlock::Student, type: :model do

  before(:all) do
    @student1 = create(:student)
    puts @student1
  end
  
  it {should have_many(:language121_classes)}
  
  it "is valid with valid attributes" do
    expect(@student1).to be_valid
  end
  
  it "has a unique email" do
    student2 = create(:student, email: "rot@gmail.com")
    student2 = build(:student, email: "rot@gmail.com")
    expect(student2).to_not be_valid
  end
  
  it "is not valid without a password" do 
    student2 = build(:student, password: nil)
    expect(student2).to_not be_valid
  end
  
  it "is not valid without a firstname" do 
    student2 = build(:student, first_name: nil)
    expect(student2).to_not be_valid
  end
  
  it "is not valid without a lastname" do 
    student2 = build(:student, last_name: nil)
    expect(student2).to_not be_valid
  end
  
  it "is not valid without an email" do
    student2 = build(:student, email: nil)
    expect(student2).to_not be_valid
  end

it "is valid with new_cls_request_notifn zero" do
    teacher2 = build(:student, membership_notifn: 0)
    expect(teacher2).to be_valid
  end

it "is valid with canceled_cls_notifn zero" do
    teacher2 = build(:student, booked_cls_notfn: 1)
    expect(teacher2).to be_valid
  end

it "is valid with cls_reminder_notifn zero" do
    teacher2 = build(:student, canceled_cls_notifn: 2)
    expect(teacher2).to be_valid
  end

it "is valid with group_cls_notifn zero" do
    teacher2 = build(:student, cls_reminder_notifn: 0)
    expect(teacher2).to be_valid
  end

it "is valid with ending_group_course_notifn zero" do
    teacher2 = build(:student, cls_change_notifn: 1)
    expect(teacher2).to be_valid
  end

end

