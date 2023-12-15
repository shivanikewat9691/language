module BxBlockLogin
  class TeachersController < ApplicationController
        
    def create
      query_email = params['email'].downcase
      teacher = AccountBlock::Teacher.find_by_email(query_email)
      if teacher
        if teacher.activated == false 
          if teacher.uniq_id != nil
            render json: {message: 'Your Account is deactivated'}, status: :unprocessable_entity
          else
            render json: {message: 'Your Account is not activated'}, status: :unprocessable_entity
          end
        else
          if teacher.authenticate(params[:password])           
            render json: AccountBlock::TeacherSerializer.new(teacher, meta: {
              token: encode(teacher.id),
            }).serializable_hash, status: :created
          else
            render json: { message: 'Invalid email or password'}, status: :unprocessable_entity
          end
        end
      else
        render json: { message: 'Invalid email or password'}, status: :unprocessable_entity
      end
    end   
    
    private

    def encode(id)
      BuilderJsonWebToken.encode id
    end
  end
end
