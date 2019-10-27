class Service < ApplicationRecord

  validates_presence_of :name, :price, :image, :description

  mount_uploader :image, ImageUploader
end
