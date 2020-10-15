class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_duration

  has_one_attached :image
end
