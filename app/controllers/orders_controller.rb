class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @order = UserItemOrder.new
  end

  def create
    @order = UserItemOrder.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        # 決済に必要な情報は同様にGemが提供する、Payjp::Charge.createというクラスおよびクラスメソッドを使用する
        amount: order_params[:price],  # amountには、実際に決済する金額が入る
        card: order_params[:token],    # cardには、トークン化されたカード情報が入る
        currency: 'jpy'
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

