# frozen_string_literal: true

module ApplicationHelper
  def get_many_serializer(s, entities)
    s.new(entities).serializable_hash[:data].map { |d| d[:attributes] }
  end

  def get_serializer(s, entity)
    s.new(entity).serializable_hash[:data][:attributes]
  end
end
