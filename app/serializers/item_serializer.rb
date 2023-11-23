# frozen_string_literal: true

class ItemSerializer
  include JSONAPI::Serializer
  include ApplicationHelper

  attributes *Item.column_names, :tags, :collection, :is_liked

  def collection
    get_serializer(CollectionSerializer, object.collection)
  end

  def tags
    object.tags
  end

  attribute :is_liked do |object, params|
    user = params[:current_user]
    user.present? ? object.liked_by_user?(user) : false
  end

  attribute :likes_total do |object|
    object.likes.size
  end

end
