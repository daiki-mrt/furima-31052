class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_duration

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :cateory_id
    validates :status_id
    validates :charge_type_id
    validates :prefecture_id
    validates :ship_duration_id
    validates :price, format: { with: /[300-9999999]/, message: "must be between 300 ~ 9999999" }
  end
end
