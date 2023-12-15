module BxBlockAppointmentManagement
  class TeacherController < ApplicationController
    require 'date'
    include BuilderJsonWebToken::JsonWebTokenValidation
    before_action :validate_json_web_token
    before_action :current_user
    # @teacher=AccountBlock::Teacher.find_by(id:1)
    DATE_FORMAT = '%Y/%m/%d'

    def previous_classes_one_to_one
      
      begin
        @language121 = @teacher.language121_classes.where("(class_time < ? AND (status = ? OR status = ?)) OR (class_time >= ? AND (status = ?))", Time.now, 3, 4, Time.now, 3)
        @group_classes = @teacher.language_classes.where("(class_time < ? AND (status = ? OR status = ?)) OR (class_time >= ? AND (status = ?))", Time.now, 1, 2, Time.now, 1)
      rescue
        @language121=[] unless @language121.present?
        @group_classes=[] unless @group_classes.present?
      end
       total =
          BxBlockAppointmentManagement::Language121Serializer.new(@language121,params: {current_user:@teacher}).serializable_hash,TeacherGroupClassSerializer.new(@group_classes,params: {current_user:@teacher}).serializable_hash

        render json: total
    end

      def upcoming_classes_one_to_one
        begin
            @language121 = @teacher.language121_classes.where("class_time >= ? AND status = ? ",Time.now, 2)
            @group_classes = @teacher.language_classes.where("class_time >= ? AND status = ? ",Time.now, 0)
          if  params[:startdate].present? && params[:enddate].present?
           @language121 = @teacher.language121_classes.where("class_date >= ? AND class_date <= ? AND status = ? AND class_time >= ? ", params[:startdate], params[:enddate], 2,Time.now)
           @group_classes = @teacher.language_classes.where("class_date >= ? AND class_date <= ? AND status = ? AND class_time >= ? ", params[:startdate], params[:enddate],0,Time.now)
          end
        rescue
          @language121=[] unless @language121.present?
          @group_classes=[] unless @group_classes.present?
        end
        total = 
          BxBlockAppointmentManagement::Language121Serializer.new(@language121, params: {current_user:@teacher}).serializable_hash,TeacherGroupClassSerializer.new(@group_classes,params: {current_user:@teacher}).serializable_hash

        render json: total
      end

    def requested_one_to_one_class
      @language121 = @teacher.language121_classes.where("class_time > ? AND status = ?",Time.now,0)

      if @language121.present?
        render json: BxBlockAppointmentManagement::Language121Serializer.new(@language121, params: {current_user:@teacher}).serializable_hash  
      else
        render json: { }
      end
    end

    def accept_one_to_one_class 
      @language121 = AccountBlock::Language121Class.find(params[:id])
      class_time = @language121.class_time
      
      begin 
        @language121exist = @teacher.language121_classes.where("class_time = ? AND status = ? ",class_time,2)
        @groupclass = @teacher.language_classes.where("class_time = ? AND status = ?",class_time,0)
      rescue
        @language121exist = [] unless @language121exist.present?
        @groupclass = [] unless @groupclass.present?
      end

      if @language121exist.present? || @groupclass.present?
        render json: {errors: [{message: "Class can't be accepted. You have already another booked class for the same date and time."}]}
      else
        @language121.update(teacher_id:@teacher.id)
        @language121.update(status:'accepted')
        emailtime = @language121.class_time-24.hours
        BxBlockNotifications::TeacherClassReminderMailer
          .teacher_class_reminder_notification(@teacher, @language121.class_date, @language121.class_time, @language121.class_type)
          .deliver_later(wait_until: emailtime)
        
          @student=@language121.student
          # @client_url = request.headers[:origin] || 'Clinet Url Missing' 
          BxBlockNotifications::StudentAcceptedClassMailer.student_accepted_class(@student,@language121.class_date,@language121.class_time).deliver_now!

        render json: { message:'Class has been accepted' }
      end
    end

    def reject_one_to_one_class

      @language121 = AccountBlock::Language121Class.find(params[:id])
      @language121.update(status:'rejected')
      @message_description= JSON.parse(params[:reject_description])
      @student=@language121.student
      BxBlockNotifications::StudentRejectClassMailer.student_reject_class(@student,@language121.class_date,@language121.class_time,@message_description).deliver_now!
      render json: { message:'Class has been rejected' }

    end

    def cancel_one_to_one_class
      @message_description=JSON.parse(params[:cancel_description]) 
      @language121=AccountBlock::Language121Class.find_by(id:params[:id])
      @group_classes=BxBlockClasses::LanguageClass.find_by(id:params[:id])
      @language121.update(status:'cancelled') if @language121.present?
      @group_classes.update(status:'cancelled') if @group_classes.present?
      if @language121.present?
        @student=@language121.student
        @language121.update(cancel_message:@message_description)
        BxBlockNotifications::StudentCanceledClassMailer.student_canceled_class(@student,@language121.class_date,@language121.class_time).deliver_now!
      end
        render json: { message:'Class has been cancelled'}
    end

    private

    def current_user
      @teacher = AccountBlock::Teacher.find_by(id: @token&.id)
      render json: {errors: [{token: I18n.t('invalid_token')},]}, status: :unprocessable_entity and return unless @teacher.present?
    end
  end
end
