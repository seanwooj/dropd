class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to welcome_path if logged_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Dropd!"
      log_in @user
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).
      permit(:name, :email, :password, :password_confirmation)
  end
end
