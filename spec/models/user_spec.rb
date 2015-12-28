require 'rails_helper'

describe User, type: :model do
  describe '.find_or_create_from_auth_hash' do
    let(:auth) { OmniAuth.config.mock_auth[:twitter] }

    context 'when an user already exists' do
      let!(:user) { create(:user) }

      it 'should find the user' do
        expect(User.find_or_create_from_auth_hash(auth)).to eq(user)
      end
    end

    context 'when is a new user' do
      it 'should create a new user' do
        expect { User.find_or_create_from_auth_hash(auth) }.to change {
          User.count
        }.by(1)
      end
    end
  end
end

