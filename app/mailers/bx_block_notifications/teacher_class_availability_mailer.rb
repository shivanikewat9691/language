module BxBlockNotifications
  class TeacherClassAvailabilityMailer < ApplicationMailer
	
      def teacher_class_availability_notification(teacher, class_date)
      @teacher = teacher
      @class_date = class_date
          
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Class Availability') do |format|
        format.html { render 'teacher_class_availability_notification' }
      end
    end

  end
end