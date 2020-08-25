class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :state, :prefecture, :shipping_fee, :day

  validates :image, :name, :text, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :state_id, :prefecture_id, :shipping_fee_id, :day_id
  end
end
