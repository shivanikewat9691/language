require 'rails_helper'

RSpec.describe AccountBlock::AssessmentOption, type: :model do
  subject {
    described_class.new(
      assessment_question_no: 3,
      answer: "Lorem 3 ipsum dolor sit amet consectetur adipisicing elit. Error, quos.",
      )
  }
  
  it "is valid with valid attributes" do
    subject.assessment_question_no = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without answer" do
    subject.answer = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without assessment_question_id" do
    subject.assessment_question_id = nil
    expect(subject).to_not be_valid
  end

end