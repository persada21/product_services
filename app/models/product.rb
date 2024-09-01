class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :name, :price, :category, presence: true
end
