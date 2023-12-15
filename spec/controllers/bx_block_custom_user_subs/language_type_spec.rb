require 'rails_helper'

RSpec.describe BxBlockCustomUserSubs::LanguageType, type: :request do
  
  LANG_TYPE = '/bx_block_custom_user_subs/language_type'

  let(:language_type_params) {{"name": "Everyday", "logo": "image"}}

  before do
    @image =  fixture_file_upload('ic_everyday.png')
    @language_type =  BxBlockCustomUserSubs::LanguageType.create(name: "Everyday", logo: @image)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@language_type.id)
  end

  context 'language type' do
    it 'will show all language type' do
      get LANG_TYPE , params: language_type_params, headers: {token: @token}
      expect(response).to have_http_status :ok
    end

    it 'will not show any language typet' do
     BxBlockCustomUserSubs::LanguageType.destroy_all
      get LANG_TYPE, headers: {token: @token}
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
