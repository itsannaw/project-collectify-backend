# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  belongs_to :user
  belongs_to :collection
end
