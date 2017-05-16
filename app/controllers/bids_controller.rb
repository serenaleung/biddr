class BidsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def new

  end

  def create
    # @bid = Bid.new bid_params
    @bid = Bid.new (bid_params)
    @auction = Auction.find(params[:auction_id])
    @bid.auction = @auction
    @bid.user = current_user
    # respond_to do |format|
      if @bid.save
        update_auction
        # format.html {redirect_to @auction, notice: "Bid submitted!"}

        redirect_to auction_path(@auction)

      #   format.js {render :create_success}
      # else
      #   format.html { flash[:alert] = "Bid not created!"
      #                 redirect_to @auction }
      #   format.js {render :create_failure}
      end
    # end
  end

  def index
    # @bid = Bid.new
    # @bids = current_user.bids
    @user = current_user
    @auctions = @user.bids

  end

  private


  def bid_params
    params.require(:bid).permit(:price)
  end

  def update_auction
    if @bid.price >= @auction.reserve_price
      @auction.meet_reserve
    @auction.save
    end
  end
end
