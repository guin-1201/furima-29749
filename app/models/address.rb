class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    PHONE_REGEX = /\A[0-9]+\z/.freeze
    validates :password, format: { length: { maximum:11 }, with: PHONE_REGEX, message: '半角数字・ハイフンなし・11桁以内で入力してください'}
  end


end
