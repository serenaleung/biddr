require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  describe '#create' do
    context 'user not signed in' do
      it 'redirects to the sign in page' do
        post :create, auction_id: 1
        expect(response).to redirect_to(new_session_path)
      end
    end
    context 'user signed in' do
      before do
        user = FactoryGirl.create(:user)
        request.session[:user_id] = user.id
      end
    end
  end
end
