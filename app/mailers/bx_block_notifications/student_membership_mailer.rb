module BxBlockNotifications
  class StudentMembershipMailer < ApplicationMailer
	
      def student_membership(student)
      @student = student
          
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Membership') do |format|
        format.html { render 'student_membership' }
      end
    end

  end
end