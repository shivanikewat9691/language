require 'rails_helper'

RSpec.describe BxBlockCustomUserSubs::StudyFormat, type: :request do
  
  STUDYFORMAT = '/bx_block_custom_user_subs/study_formats'

  let(:study_format_params) {{"name": "1-on-1", "logo": "image"}}

  before do
    @image =  fixture_file_upload('ic_oneToOne.png')
    @study_format =  BxBlockCustomUserSubs::StudyFormat.create(name: "1-on-1", logo: @image)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@study_format.id)
  end

  context 'study format' do
    it 'will show all Study formats' do
      get STUDYFORMAT , params: study_format_params, headers: {token: @token}
      expect(response).to have_http_status :ok
    end

    it 'will not show any study format' do
     BxBlockCustomUserSubs::StudyFormat.destroy_all
      get STUDYFORMAT, headers: {token: @token}
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
