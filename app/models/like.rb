class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :photo_id, uniqueness: { scope: :user }
end
