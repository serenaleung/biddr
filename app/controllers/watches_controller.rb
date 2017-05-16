class WatchesController < ApplicationController

  before_action :authenticate_user!

  def index
    user = current_user
    @auctions = Auction.find params[:id]
    current_user.watched_auctions
    render 'watches/index'
  end

  def create
    auction = Auction.find(params[:auction_id])
    watch = Watch.new(user: current_user, auction: auction)

    if watch.save
      redirect_to auction_path(auction), notice: 'Auction Liked!'
    else
      redirect_to auction_path(auction), alert: watch.errors.full_messages
    end

  end

  def destroy
    watch = Watch.find(params[:id])
    if watch.destroy
      redirect_to auction_path(watch.auction), notice: 'Auction Unliked!'
    else
      redirect_to auction_path(watch.auction), alert: watch.errors.full_messages
    end
  end

end
