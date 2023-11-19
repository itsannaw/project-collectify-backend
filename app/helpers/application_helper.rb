# frozen_string_literal: true

module ApplicationHelper
  def get_many_serializer(s, entities)
    s.new(entities).serializable_hash[:data].map { |d| d[:attributes] }
  end
end
