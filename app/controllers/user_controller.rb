class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation)

    if @user.save
      session[:current_user] = @user.id
      redirect_to dashboard_path(session[:current_user]), notice: "Cool! You're signed up!"
    else
      render :new, notice: "Something wrong."
    end
  end
end
