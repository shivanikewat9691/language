module BxBlockLandingpage3
  class FrequentlyAskedQuestionsController < ApplicationController

    def index
      @frequently_asked_question = BxBlockLandingpage3::FrequentlyAskedQuestion.all
      serializer = BxBlockLandingpage3::FrequentlyAskedQuestionsSerializer.new(@frequently_asked_question).serializable_hash
      render json: serializer, status: :ok
    end

    def create
      @frequently_asked_questions = BxBlockLandingpage3::FrequentlyAskedQuestion.new(frequently_asked_questions_params)
      if @frequently_asked_questions.save
        render json: BxBlockLandingpage3::FrequentlyAskedQuestionsSerializer.new(@frequently_asked_questions).serializable_hash, status: :created
      else
        render json:{errors: @frequently_asked_questions.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def frequently_asked_questions_params
      params.permit(:title,:description)
    end
  end
end


