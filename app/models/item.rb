class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_duration

  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image 
    validates :name
    validates :content
    validates :category_id, numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :charge_type_id, numericality: { other_than: 0 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :ship_duration_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300 }
    validates :price, numericality: { less_than_or_equal_to: 9999999 }
  end
end
