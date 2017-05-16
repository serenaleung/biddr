require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:user) {FactoryGirl.create :user}

  describe "#new" do
    before { request.session[:user_id] = user.id}

    it 'renders a new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'instantiates a new auction instance variable' do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end

  end

  describe '#create' do
    before { request.session[:user_id] = user.id}

    def valid_request
      post :create, params: { auction: {
                              title: 'Auction Auction Name',
                              details: 'Auction Details',
                              end_date: Time.now + 5.days,
                              reserve_price: rand(1..100)
      }}
    end

    context 'with valid parameters' do
      it 'saves a record to the database' do
        count_before = Auction.count
        valid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before +1)
      end

      it 'redirects to the auction index page' do
        valid_request
        expect(response).to redirect_to(auctions)
      end

    end
  end
end
