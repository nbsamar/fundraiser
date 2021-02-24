class Profile < ApplicationRecord
  has_many :profile_users
  has_many :users, through: :profile_users
end
