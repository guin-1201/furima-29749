class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :shipping_charge_class_id, :ship_address_id, :ship_date_class_id, :price)
  end

  
end
