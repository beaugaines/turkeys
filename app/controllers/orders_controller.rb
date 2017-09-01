class OrdersController < ApplicationController

  def new
    @season = Season.select(:id, :name, :pick_up_dates).active
    @pick_up_days = @season.pick_up_dates
    @order = Order.new
    @items = Item.select(:id, :name)
    @order.order_items.build
    @locations = Location.pluck(:name, :id)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = 'Order saved!'
      redirect_to @order
    else
      flash[:alert] = 'Order failed to register'
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:season_id, :location_id, :first_name, :last_name,
      :phone_number, :pick_up_date, order_items_attributes: [:id, :item_id, :quantity])
  end
end
