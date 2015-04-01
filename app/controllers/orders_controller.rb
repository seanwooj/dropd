class OrdersController < ApplicationController
  def show
    unless current_user && current_user.boss?
      redirect_to home_path
    end
  end

  def index
    unless current_user && current_user.boss?
      redirect_to home_path
    end

    @orders = Order.all
  end

end
