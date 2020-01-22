class Broadcast < ApplicationRecord
  has_one_attached :post_image
  belongs_to :member
end
