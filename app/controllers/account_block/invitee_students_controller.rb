module AccountBlock
  class InviteeStudentsController < ApplicationController
	  def activate_account
      token = params[:token]
      @client_url = params[:client_url]
      @token = BuilderJsonWebToken.decode(token)
      @invitee_student = AccountBlock::InviteeStudent.find_by(id:@token.id).update(activated: true)
      redirect_to "#{@client_url}/StudentEmailVerified?token=#{token}"
    end

    def invitee_student_names
      token = request.headers[:token] || params[:token]
      @token = BuilderJsonWebToken.decode(token)
      @invitee_student = AccountBlock::InviteeStudent.find_by(id: @token.id)
      if @invitee_student
        render json: { id: @invitee_student.id, email: @invitee_student.email, first_name: @invitee_student.first_name, last_name: @invitee_student.last_name}
    
      end
    end
  end
end
