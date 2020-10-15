class UserItemOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :purchase_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    PHONE_REGEX = /\A[0-9]+\z/.freeze
    validates :phone, format: { length: { maximum: 11 }, with: PHONE_REGEX, message: '半角数字・ハイフンなし・11桁以内で入力してください'}
  end


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end

end