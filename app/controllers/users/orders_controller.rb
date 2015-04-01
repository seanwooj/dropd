class Users::OrdersController < ApplicationController
  # == Schema Information
  #
  # Table name: orders
  #
  #  id                        :integer          not null, primary key
  #  note                      :text
  #  order_contents            :text
  #  order_number              :string
  #  customer_email            :string
  #  customer_phone            :string
  #  customer_delivery_address :string
  #  customer_delivery_city    :string
  #  customer_delivery_state   :string
  #  customer_delivery_zipcode :integer
  #  contacted                 :boolean          default(FALSE)
  #  user_id                   :integer
  #  created_at                :datetime         not null
  #  updated_at                :datetime         not null
  #  customer_name             :string
  #  status                    :string           default("open")
  #
  before_action :load_user

  def index
    @orders = @user.orders
  end

  def new
    @order = @user.orders.build
  end

  def create
    @order = @user.orders.build(order_params)
    if @order.save
      redirect_to user_orders_path(@user)
      flash.now[:success] = 'Order created!'
    else
      render 'new'
      flash.now[:alert] = 'Fix some stuff'
    end

  end

  def destroy

  end

  def edit

  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def order_params
    params.require(:order).permit(:customer_name, :customer_phone, :customer_email, :customer_delivery_address, :customer_delivery_city, :customer_delivery_state, :customer_delivery_zipcode, :order_number, :order_contents, :note)
  end
end
