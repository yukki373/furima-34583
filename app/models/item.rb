class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
    validates :price
  end
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

  validates_inclusion_of :price, in: 300..999999
end
