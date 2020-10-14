class UserItemOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id

  def save
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_id: purchase_id)
    Purchases.create(user_id: user_id, item_id: item_id)
  end

end