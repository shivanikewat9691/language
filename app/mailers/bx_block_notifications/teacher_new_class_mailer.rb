module BxBlockNotifications
  class TeacherNewClassMailer < ApplicationMailer
	
      def teacher_new_class_notification(teacher, class_date)
      @teacher = teacher
      @class_date = class_date
        
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'New Class') do |format|
        format.html { render 'teacher_new_class_notification' }
      end
    end

  end
end