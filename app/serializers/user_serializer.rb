# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :avatar, :email, :username, :first_name, :last_name, :updated_at, :created_at, :admin, :blocked
end
