class SessionController < ApplicationController
  def new

  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]

    user = User.find_by(email: email)

    if (user) && (user.authenticate password)
      session[:current_user] = user.id
      redirect_to dashboard_path(id: session[:current_user]), notice: "You're signed in #{user.username}!"
    else
      redirect_to root_path, notice: "Please try again."
    end
  end

  def delete
    session.delete :current_user
    redirect_to root_path
  end
end
