class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @order = Purchase.new
  end

  def create
    @order = Purchase.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end

end


private

  #途中　アドレステーブルからもひっぱってくる
  def order_params
    params.require(:purchase).permit(:user_id, :item_id)
  end

  def move_to_index
    unless user_signed_in?
      return redirect_to new_user_session_path
    end
  end

end