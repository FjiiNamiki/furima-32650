class OrderDestination
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zipcode, :prefecture_id, :city, :adress, :building, :phonenumber
  with_options presence: true do
    validates :token, :city, :adress, :user_id, :item_id
    validates :zipcode, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :phonenumber, format: {with: /\A\d{,11}\z/}
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, adress: adress, building: building, phonenumber: phonenumber, order_id: order.id)
  end


end