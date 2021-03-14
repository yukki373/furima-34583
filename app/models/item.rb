class Item < ApplicationRecord

  validates :name,                presence: true
  validates :description,         presence: true
  validates :category_id,         presence: true
  validates :status_id,           presence: true
  validates :shipping_charge_id,  presence: true
  validates :shipping_area_id,    presence: true
  validates :days_to_ship_id,     presence: true
  validates :price,               presence: true

  belongs_to :user
  has_one_attached :image
end
