class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :day

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id, :state_id, :prefecture_id, :shipping_fee_id, :day_id
  end

  with_options presence: true do
    validates :image, :name, :text
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end
end
