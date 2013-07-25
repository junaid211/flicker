class SessionsController < ApplicationController
  def login
  end

  def home
  end

  def profile
  end

  def setting
  end
  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.name}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Email or Password"
      flash[:color]= "invalid"
      render "login"
    end

  end
end
