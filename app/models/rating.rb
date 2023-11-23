class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates_uniqueness_of :user_id, scope: :collection_id
end
