# frozen_string_literal: true

class CollectionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :desc, :image_url, :category_id, :user_id,
             :custom_string1_name, :custom_string1_enabled, :custom_string2_name, :custom_string2_enabled,
             :custom_string3_name, :custom_string3_enabled, :custom_text1_name, :custom_text1_enabled,
             :custom_text2_name, :custom_text2_enabled, :custom_text3_name, :custom_text3_enabled,
             :custom_int1_name, :custom_int1_enabled, :custom_int2_name, :custom_int2_enabled,
             :custom_int3_name, :custom_int3_enabled, :custom_bool1_name, :custom_bool1_enabled,
             :custom_bool2_name, :custom_bool2_enabled, :custom_bool3_name, :custom_bool3_enabled,
             :custom_date1_name, :custom_date1_enabled, :custom_date2_name, :custom_date2_enabled,
             :custom_date3_name, :custom_date3_enabled, :category, :user, :ratings, :created_at

  attribute :rating do |object, params|
    user = params[:current_user]
    user.present? ? object.rating_by_user(user) : false
  end

  attribute :rating_total do |object, params|
    ratings_count = object.ratings.size
    ratings_sum = object.ratings.reduce(0) { |sum, rating_item| sum + rating_item.rating }
    (ratings_sum / ratings_count.to_f).round(2)
  end

  attribute :user do |object|
    object.user.attributes.slice('first_name', 'last_name', 'username', 'avatar') if object.user.present?
  end

end
