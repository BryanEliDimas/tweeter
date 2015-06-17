class TweetsController < ApplicationController
  before_action do
    @current_user = User.find_by(id: session[:current_user])
  end

  def index
    @user = User.new
  end

  def dashboard
    if @current_user.nil?
      redirect_to root_path
    end
  end
end
