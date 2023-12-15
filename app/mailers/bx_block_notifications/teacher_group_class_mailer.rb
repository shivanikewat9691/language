module BxBlockNotifications
  class TeacherGroupClassMailer < ApplicationMailer
	
      def teacher_group_class_notification(teacher, class_date)
      @teacher = teacher
      @class_date = class_date
          
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Group Class') do |format|
        format.html { render 'teacher_group_class_notification' }
      end
    end

  end
end