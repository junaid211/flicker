class UsersController < ApplicationController

  def index

  end
  def new

  end
  def create

    @user=User.new(params[:user])
    @user.save

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def show

    @user=User.find(params[:id])

  end
  def exist

  end
end
