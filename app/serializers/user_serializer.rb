class UserSerializer < ActiveModel::Serializer
  attributes :username, :auth_token
end
