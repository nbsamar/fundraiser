class Campaign < ApplicationRecord
  belongs_to :user
  enum status: %i[drafted approved rejected]

  # after_create :add_campaign_points

  def add_campaign_points
    unless self.user.campaigns.approved.empty?

    end
  end
end
