module BxBlockNotifications
  class StudentClassReminderMailer < ApplicationMailer
	
      def student_class_reminder(student, class_date)
      @student = student
      @class_date = class_date
          
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Your Class Coming Up') do |format|
        format.html { render 'student_class_reminder' }
      end
    end

  end
end