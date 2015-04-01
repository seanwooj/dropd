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

  def update_status
    @order = Order.find(params[:id])
    event = params[:order][:event].to_sym
    @order.fire_status_event(event)
    @order.save!
    params[:order][:ret_url].nil? ? redirect_to(@order) : redirect_to(params[:order][:ret_url])
  end

end
