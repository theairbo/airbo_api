class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :invitation_code, :board_memberships
end
