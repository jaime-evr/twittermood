require 'rails_helper'

describe SessionsController, type: :controller do
  before { request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter] }

  describe 'GET create' do
    before { get :create, provider: :twitter }

    it 'should redirect to home page' do
      expect(response).to redirect_to(root_path)
    end
  end
end

