class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :board_memberships
end
