module BxBlockNotifications
  class TeacherNotificationsController < ApplicationController

  NO_TEACHER_ERR = 'No teacher found with this email'

	def class_reminder
     @email = params[:email]
     @class_date = params[:class_date]
     @class_time = params[:class_time]
     @class_subject = params[:class_subject]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date && @class_time && @class_subject
        TeacherClassReminderMailer.teacher_class_reminder_notification(@teacher, @class_date, @class_time, @class_subject).deliver_now!
          render json: {message: 'Class Reminder email sent'}, status: :ok
        else
          render json: { message: 'Class details missing for this email'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

    def class_availability
     @email = params[:email]
     @class_date = params[:class_date]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date 
        TeacherClassAvailabilityMailer.teacher_class_availability_notification(@teacher, @class_date).deliver_now!
          render json: {message: 'Class Availability email sent'}, status: :ok
        else
          render json: { message: 'Class availability details missing'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

    def new_class
    	@email = params[:email]
     	@class_date = params[:class_date]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date 
        TeacherNewClassMailer.teacher_new_class_notification(@teacher, @class_date).deliver_now!
          render json: {message: 'New Class email sent'}, status: :ok
        else
          render json: { message: 'New Class details missing'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

    def canceled_class
    	@email = params[:email]
     	@class_date = params[:class_date]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date 
        TeacherCanceledClassMailer.teacher_canceled_class_notification(@teacher, @class_date).deliver_now!
          render json: {message: 'Canceled Class email sent'}, status: :ok
        else
          render json: { message: 'Canceled Class details missing'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

    def group_class
    	@email = params[:email]
     	@class_date = params[:class_date]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date 
        TeacherGroupClassMailer.teacher_group_class_notification(@teacher, @class_date).deliver_now!
          render json: {message: 'Group Class email sent'}, status: :ok
        else
          render json: { message: 'Group Class details missing'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

    def ending_group_course
    	@email = params[:email]
     	@class_date = params[:class_date]
      @teacher = AccountBlock::Teacher.find_by(email: @email)
      if @teacher 
        if @class_date 
        TeacherEndingGroupCourseMailer.teacher_ending_group_course_notification(@teacher, @class_date).deliver_now!
          render json: {message: 'Ending group course email sent'}, status: :ok
        else
          render json: { message: 'Ending group course details missing'}
        end
      else
          render json: { message: NO_TEACHER_ERR}
      end
    end

  end
end