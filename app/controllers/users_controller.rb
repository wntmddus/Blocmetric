class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
    authroize User
  end

  def show
    @user = User.find(params[:id])
    authroize @user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  def switchrole
    user = User.find(params[:id])
    if user.role == :standard
      user.role = :developer
    elsif user.role == :developer
      user.role = :standard
    end
    user.save
    redirect_to user_path(user)
  end
end
