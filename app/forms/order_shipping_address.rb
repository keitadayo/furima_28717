class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone

  postal_code = /\A[0-9]{3}-[0-9]{4}\z/
  phone_num = /\d{10,11}/

  with_options presence: true do
    validates :postal_code, format: { with: postal_code, message: 'is invalid. Include hyphen(-)' }
    validates :city, :address, :token
    validates :phone, format: { with: phone_num }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone)
  end
end
