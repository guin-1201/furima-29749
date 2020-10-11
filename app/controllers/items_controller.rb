class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :shipping_charge_class_id, :ship_address_id, :ship_date_class_id, :price)
  end
  
end



# class  DonationsController < ApplicationController
#   def index
#   end

#   def new
#     @donation = UserDonation.new   #「UserDonation」に編集
#   end

#   def create
#     @donation = UserDonation.new(donation_params)   #「UserDonation」に編集
    
#     if @donation.valid?
#       @donation.save  # バリデーションをクリアした時
#       return redirect_to root_path
#     else
#       render "new"    # バリデーションに弾かれた時
#     end
#   end
 
#   private
 
#   def donation_params
#    #「住所」「寄付金」のキーも追加
#    params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
#   end
 
#  end