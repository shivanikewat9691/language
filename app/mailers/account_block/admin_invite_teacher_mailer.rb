module AccountBlock
  class AdminInviteTeacherMailer < ApplicationMailer
	
      def admin_invite_teacher(invite_teacher, host, client_url)
      @invite_teacher = invite_teacher
      @host = host
      @client_url = client_url
      token = encoded_token
      
      stage_url = "https://languageplatformws2022-290480-ruby.b290480.stage.eastus.az.svc.builder.ai"
      dev_url = "https://languageplatformws2022-290480-ruby.b290480.dev.eastus.az.svc.builder.cafe"

      # byebug
      if @client_url == dev_url
        @url = "https://languageplatformws2022-290480-react.b290480.dev.eastus.az.svc.builder.cafe/TeacherSignup?token=#{token}"
      elsif @client_url == stage_url

        @url = "https://languageplatformws2022-290480-react.b290480.stage.eastus.az.svc.builder.ai/TeacherSignup?token=#{token}"
      else 
       @url = "https://languageplatformws2022-290480-react.b290480.dev.eastus.az.svc.builder.cafe/TeacherSignup?token=#{token}"
      end


      attachments.inline["lingoamojr.png"] = File.read("#{Rails.root}/app/assets/images/lingoamojr.png")

      mail(
          to: @invite_teacher.email,
          from: 'builder.bx_dev@engineer.ai',
          subject: 'Account activation') do |format|
        format.html { render 'admin_invite_teacher' }
      end
    end

    private

    def encoded_token
      BuilderJsonWebToken.encode @invite_teacher.id, 60.minutes.from_now
    end
  end
end
