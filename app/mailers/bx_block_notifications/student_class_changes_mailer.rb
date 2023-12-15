module BxBlockNotifications
  class StudentClassChangesMailer < ApplicationMailer
	
      def student_class_changes(student, class_date)
      @student = student
      @class_date = class_date
          
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Class Changed') do |format|
        format.html { render 'student_class_changes' }
      end
    end

  end
end