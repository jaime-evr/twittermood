require 'rails_helper'

describe SessionsController, type: :controller do
  before { request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter] }

  describe 'POST create' do
    before { post :create, provider: :twitter }

    it 'should redirect to home page' do
      expect(response).to redirect_to(root_path)
    end
  end
end

