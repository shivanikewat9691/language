module BxBlockNotifications
  class StudentRejectClassMailer < ApplicationMailer
      def student_reject_class(student, class_date,class_time,message_description)
      @student = student
      @class_date = class_date
      @class_time = class_time
      @message_description=message_description
      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")
      mail(
          to: @student.email,
          from: 'builder.bx_dev@engineer.a',
          subject: 'Your cant make the 1-on-1 class with you') do |format|
        format.html { render 'student_reject_class' }
      end
    end

  end
end