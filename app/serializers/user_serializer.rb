class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username, :first_name, :last_name, :updated_at, :created_at
end
