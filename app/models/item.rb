class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge_class
  belongs_to_active_hash :ship_address
  belongs_to_active_hash :ship_date_class

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product
    validates :description
    validates :category_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :shipping_charge_class_id, numericality: { other_than: 0 }
    validates :ship_address_id, numericality: { other_than: 0 }
    validates :ship_date_class_id, numericality: { other_than: 0 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

end

