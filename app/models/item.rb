# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :item_tags
  belongs_to :user
  belongs_to :collection
end
