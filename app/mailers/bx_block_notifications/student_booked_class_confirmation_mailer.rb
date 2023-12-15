module BxBlockNotifications
  class StudentBookedClassConfirmationMailer < ApplicationMailer
	
      def student_booked_class_confirmation(student, class_date)
      @student = student
      @class_date = class_date
          
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Class Booked') do |format|
        format.html { render 'student_booked_class_confirmation' }
      end
    end

  end
end