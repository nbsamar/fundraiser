class User < ApplicationRecord
  has_many :campaigns
  has_many :profile_users
  has_many :profiles, through: :profile_users

  def credibility_score
    t = 0
    self.profiles.map do |p|
      t += p.points
    end
    t
  end
end
