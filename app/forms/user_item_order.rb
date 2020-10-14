class UserItemOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id, :token

  validates :token, presence: true

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_id: purchase_id)
    Purchases.create(user_id: user_id, item_id: item_id)
  end

end