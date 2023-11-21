# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :item_tags
  has_many :tags, through: :item_tags
  belongs_to :user
  belongs_to :collection
end
