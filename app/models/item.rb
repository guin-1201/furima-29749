class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :images
    validates :product
    validates :description
    validates :category_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :shipping_charge_class_id, numericality: { other_than: 0 }
    validates :ship_address_id, numericality: { other_than: 0 }
    validates :ship_date_class_id, numericality: { other_than: 0 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  end


end

