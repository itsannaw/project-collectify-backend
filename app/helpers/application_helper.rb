# frozen_string_literal: true

module ApplicationHelper
  def get_many_serializer(s, entities, options = {})
    s.new(entities, { params: options }).serializable_hash[:data].map { |d| d[:attributes] }
  end

  def get_serializer(s, entity, options = {})
    s.new(entity, { params: options }).serializable_hash[:data][:attributes]
  end
end
