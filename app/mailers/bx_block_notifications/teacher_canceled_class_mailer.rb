module BxBlockNotifications
  class TeacherCanceledClassMailer < ApplicationMailer
	
      def teacher_canceled_class_notification(teacher, class_date)
      @teacher = teacher
      @class_date = class_date
          
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Canceled Class') do |format|
        format.html { render 'teacher_canceled_class_notification' }
      end
    end

  end
end