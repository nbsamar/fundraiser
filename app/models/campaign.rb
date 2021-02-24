class Campaign < ApplicationRecord
  belongs_to :user
  enum status: %i[drafted approved rejected]

  after_create :add_campaign_points

  def add_campaign_points
    user = self.user
    profile = Profile.find_by(name: 'Through Campaign')
    unless user.campaigns.approved.empty?
      ProfileUser.create(user_id: user.id, profile_id: profile.id)
    end
  end
end
