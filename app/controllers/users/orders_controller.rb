class Users::OrdersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @orders = user.orders
  end

  def new

  end

  def create

  end

  def destroy

  end

  def edit

  end
end
