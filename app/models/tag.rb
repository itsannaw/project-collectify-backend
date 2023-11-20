# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :item_tags
end
