require 'rails_helper'

RSpec.describe BxBlockLandingpage3::Language, type: :request do
  
  LANG = '/bx_block_landingpage3/language'

  let(:language_params) {{"language_name": "English", "logo": "image"}}

  before do
    @image =  fixture_file_upload('german.png')
    @language =  BxBlockLandingpage3::Language.create(language_name: "English", logo: @image)
    @token = BuilderJsonWebToken::JsonWebToken.encode(@language.id)
  end

  context 'Languages' do
    it 'will show all languages' do
      get LANG , params: language_params, headers: {token: @token}
      expect(response).to have_http_status :ok
    end

    it 'will not show any languages' do
      BxBlockLandingpage3::Language.destroy_all
      get LANG, headers: {token: @token}
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
