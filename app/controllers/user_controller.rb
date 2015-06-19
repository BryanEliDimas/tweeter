class UserController < ApplicationController
  before_action do
    @current_user = User.find_by(id: session[:current_user])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation, :username)

    if @user.save
      session[:current_user] = @user.id
      redirect_to dashboard_path(session[:current_user]), notice: "Cool! You're signed up #{@user.username}!"
    else
      render :new, notice: "Something wrong."
    end
  end

  def follow
    user = User.find params[:id]

    @current_user.follow(user)
    redirect_to dashboard_path(id: @current_user.id)
  end

  def unfollow
    user = User.find params[:id]

    @current_user.stop_following(user)
    redirect_to dashboard_path(id: @current_user.id)
  end

end
