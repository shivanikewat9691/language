module AccountBlock
  class AssessmentQuestionsSerializer < BuilderBase::BaseSerializer
    attributes :language, :level, :question, :question_no, :answer
  end
end