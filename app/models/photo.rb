class Photo < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :featured_image
end
