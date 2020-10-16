class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_params, except: [:index, :show]

  def index
    if user_signed_in? && current_user.id != @item.user.id && @item.purchase.blank?
      @order = UserItemOrder.new
    else
      return redirect_to root_path
    end
  end

  def create
    @order = UserItemOrder.new(order_params)
      if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
  end

end


private

  def order_params
    params.require(:user_item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    unless user_signed_in?
      return redirect_to new_user_session_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      # 決済に必要な情報は同様にGemが提供する、Payjp::Charge.createというクラスおよびクラスメソッドを使用する
      amount: @item.price,           # amountには、実際に決済する金額が入る
      card: params[:token],    # cardには、トークン化されたカード情報が入る
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

end

