class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, uniqueness: true
  validates :desc, presence: true
  # validates :image_url, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
end
