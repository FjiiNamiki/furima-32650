class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :lastname_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :firstname_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :lastname_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }


  
end
