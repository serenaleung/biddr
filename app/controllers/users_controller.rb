class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
    @bids = Bid.where(user_id: @user.id).order(created_at: :desc)
  end

  def user_params
    params.require(:user).permit([:name,
                                  :email,
                                  :password,
                                  :password_confirmation])
  end
end
