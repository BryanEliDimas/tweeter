class TweetsController < ApplicationController
  before_action do
    @current_user = User.find_by(id: session[:current_user])
  end

  def index
    @user = User.new
  end

  def dashboard
    @users = User.all


    if @current_user.nil?
      redirect_to root_path
    end

    # @user = User.find session[:current_user]

    @tweet = Tweet.new


    followers_id = @current_user.following_users.pluck(:id)
    tweets_ids = followers_id << @current_user.id

    @tweets = Tweet.where(user_id: tweets_ids).order("created_at desc")

  end

  def create
    @tweet = Tweet.new params.require(:tweet).permit(:content)
    @tweet.user_id = @current_user.id

    if @tweet.save
      redirect_to dashboard_path(id: @current_user.id)
    else
      render :new
    end
  end
end
