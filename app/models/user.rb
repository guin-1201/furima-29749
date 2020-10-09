class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX, uniqueness: true, inclusion: { in: %w(@)}}
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { length: { minimum: 7 }, with: PASSWORD_REGEX, message: 'passwordは英字と数字の両方を含めて設定してください'}
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :last_name, format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."}
    NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :last_name_kana, format: { with: NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, format: { with: NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters."}
    validates :birthday
  end

end