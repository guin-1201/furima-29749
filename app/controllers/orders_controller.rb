class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_params

  def index
    redirect_to new_card_path and return unless current_user.card.present?
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
    params.require(:user_item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    unless user_signed_in?
      return redirect_to new_user_session_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      # 決済に必要な情報は同様にGemが提供する、Payjp::Charge.createというクラスおよびクラスメソッドを使用する
      amount: @item.price,           # amountには、実際に決済する金額が入る
      customer: customer_token, # 顧客のトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

end

