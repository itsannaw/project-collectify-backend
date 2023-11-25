# frozen_string_literal: true

class Item < ApplicationRecord
  include Kaminari::PageScopeMethods
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  belongs_to :user
  belongs_to :collection
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :title, presence: true

  def liked_by_user?(user)
    likes.exists?(user_id: user.id)
  end
end
