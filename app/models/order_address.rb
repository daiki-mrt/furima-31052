class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :order_id, :postal_code, :prefecture_id, :city, :street_num, :building, :phone_num, :order_id

  with_options presence: true do
    validates :user_id  
    validates :order_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ } #ハイフンが必要
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street_num
    validates :phone_num, format: { with: /\A\d{10,11}\z/ } #ハイフン不要
  end

  def save
    order = Order.create(user_id: user_id, order_id: order_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_num: street_num, building: building, phone_num: phone_num, order_id: order_id)
  end
end