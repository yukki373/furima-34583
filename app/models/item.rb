class Item < ApplicationRecord

  validates :image,               presence: true
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

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :stasus

  validates :category_id,          numericality: { other_than: 1 } 
  validates :status_id,            numericality: { other_than: 1 } 
  validates :shipping_charge_id,   numericality: { other_than: 1 } 
  validates :shipping_area_id,     numericality: { other_than: 1 } 
  validates :days_to_ship_id,      numericality: { other_than: 1 } 

end
