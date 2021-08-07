class Item < ApplicationRecord
  validates :title, :discription, :image, :price, presence: true
  validates :category_id, :condition_id, :shipping_pay_id, :prefecture_id, :transport_day_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_pay
  belongs_to :prefecture
  belongs_to :transport_day
end
