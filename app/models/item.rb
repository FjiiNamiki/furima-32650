class Item < ApplicationRecord
  validates :title, :discription, :image, :price, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_pay_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :transport_day_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { in: 300..9999999 }



  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_pay
  belongs_to :prefecture
  belongs_to :transport_day
end
