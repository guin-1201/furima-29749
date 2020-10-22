class Card < ApplicationRecord
  belongs_to :user, optional: true
  
    #CARD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
    validates :card_token, presence: { message: 'カード情報を入力してください' }
    validates :customer_token, presence: true

end
