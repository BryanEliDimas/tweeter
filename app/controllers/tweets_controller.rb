class TweetsController < ApplicationController
  before_action do
    @current_user = User.find_by(id: session[:current_user])
  end

  def index
    @user = User.new
  end

  def dashboard
    @users = User.all.reject{|n| n == @current_user}


    if @current_user.nil?
      redirect_to root_path
    end

    # @user = User.find session[:current_user]

    @tweet = Tweet.new

    unless @current_user.nil?
      followers_id = @current_user.following_users.pluck(:id)
      tweets_ids = followers_id << @current_user.id
    end

    @tweets = Tweet.where(user_id: tweets_ids).order("created_at desc").page(params[:page]).per(5)

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
