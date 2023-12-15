module AccountBlock    
	class AssessmentsController < ApplicationController
	include BuilderJsonWebToken::JsonWebTokenValidation
	before_action :validate_json_web_token 

	def get_test
    token = request.headers[:token] 
    @token = BuilderJsonWebToken.decode(token)
    @student = AccountBlock::Student.find_by(id: @token.id)
		@questions = AccountBlock::AssessmentQuestion.order(:question_no).all
		
	 	test_paper = {
 		data:  @questions.map.with_index {|question, index| {id: index+1, questionNo: question.question_no, question:  question.question,  options: [option1: question.assessment_options[0].answer, option2: question.assessment_options[1].answer, option3: question.assessment_options[2].answer, option4: question.assessment_options[3].answer]
   		 }} 		
	 	}
	  	render json:  test_paper
  	end

  	def create
      token = request.headers[:token] 
      @token = BuilderJsonWebToken.decode(token)
      @student = AccountBlock::Student.find_by(id: @token.id)
  		@language = params[:language]
  		@test_level = params[:test_level]
  		
      @test_answers = AccountBlock::AssessmentQuestion.all
      @student_answers = params[:user_answers]
      if @student_answers.empty?
        return render json: {errors: 'No answers found to evaluate'},
          status: :unprocessable_entity
      end

      @score = 0
      result_level = ''

      @test_answers.each_with_index{ |q, i|
        if q.question_no == @student_answers[i][:questionNo] && q.answer == @student_answers[i][:selectedValue]
           @score += 1 
        end        
      }

      if @score > 77
        result_level = 'C2'
      elsif @score > 63
        result_level = 'C1'
        elsif @score > 52
        result_level = 'B2'
        elsif @score > 43
        result_level = 'B1'
        elsif @score > 29
        result_level = 'A2'
      else
        result_level = "A1"
      end

      test_output = {
        result: result_level,
        score: "#{@score}/#{@test_answers.count}",
        student_result: @test_answers.map.with_index{ |q, i|{
             id: i+1, questionNo: q.question_no, question: q.question , selectedValue: @student_answers[i][:selectedValue], correctAns: q.answer     }  
        }
      }

      @assessment = AccountBlock::Assessment.new(assessment_params)
      @assessment.student_id = @student.id
      @assessment.language = @language
      @assessment.assessment_date = DateTime.now
      @assessment.assessment_level = @test_level
      @assessment.assessment_score = @score
      @assessment.assessment_grade = result_level


      if @student.update(language_level: result_level)
        if @assessment.save      
          render json: test_output, status: :ok
        else
          render json: {errors: format_activerecord_errors(@assessment.errors)},
            status: :unprocessable_entity
      	end
      end

    end

    private

    def format_activerecord_errors(errors)
      result=[]
      errors.each do |attribute, error|
        result << {attribute =>error}
      end
      result
    end

    def assessment_params
      params.permit(:student_id, :language, :assessment_date, :assessment_level, :assessment_score, :assessment_grade)
    end

	end
end
