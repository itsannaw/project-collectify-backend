# frozen_string_literal: true

class Collection < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :items, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :desc, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  def rating_by_user(user)
    collection_rating = ratings.find_by(user_id: user.id)
    if collection_rating.present?
      collection_rating.rating
    end
  end
end
