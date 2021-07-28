class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/
  validates :encrypted_password, presence: true, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
  validates :encrypted_password_confirmation, presence: true
  validates :lastname_kanji, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :firstname_kanji, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :lastname_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/}
  validates :firstname_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/}
  validates :birthday, presence: true

end
