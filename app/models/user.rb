class User < ApplicationRecord
  has_many :board_memberships
end
