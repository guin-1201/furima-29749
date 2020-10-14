class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @order = UserItemOrder.new
  end

  def create
    @order = UserItemOrder.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end

end


private

  def order_params
    params.require(:user_item_order).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    unless user_signed_in?
      return redirect_to new_user_session_path
    end
  end

end

