class OrdersController < ApplicationController
  def show
    unless current_user && current_user.boss?
      redirect_to home_path
    end

    @order = Order.find(params[:id])
  end

  def index
    unless current_user && current_user.boss?
      redirect_to home_path
    end

    @orders = Order.all
  end

  def update

  end

end
