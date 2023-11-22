# frozen_string_literal: true

class ItemSerializer
  include JSONAPI::Serializer
  include ApplicationHelper

  attributes *Item.column_names, :tags, :collection

  def collection
    get_serializer(CollectionSerializer, object.collection)
  end

  def tags
    object.tags
  end
end
