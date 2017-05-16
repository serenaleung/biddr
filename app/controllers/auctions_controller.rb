class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    # @auctions = Auction.where.not(aasm_state: ['draft', 'won', 'canceled']).order(created_at: :desc).page(params[:page])
  end

  def new
    @auction = Auction.new
  end

  def show
    @auction = Auction.find params[:id]
    @bids = @auction.bids.order(created_at: :desc)
    @newbid = @auction.bids.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to @auction, notice: "Auction created successfully."
    else
      flash[:alert] = "Auction has not been created!"
      render :new
    end
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
  end
end
