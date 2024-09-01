class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category, :image, :is_active
  belongs_to :user
end
