module BxBlockNotifications
  class TeacherClassReminderMailer < ApplicationMailer
      def teacher_class_reminder_notification(teacher, class_date, class_time, class_subject)
      @teacher = teacher
      @class_date = class_date
      @class_time = class_time
      @class_subject = class_subject
    
      mail(
          to: @teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Class Reminder') do |format|
        format.html { render 'teacher_class_reminder_notification' }
      end
    end

    private

  end
end