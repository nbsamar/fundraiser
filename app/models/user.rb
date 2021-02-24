class User < ApplicationRecord
  has_many :campaigns
  has_many :profile_users
  has_many :profiles, through: :profile_users
end
