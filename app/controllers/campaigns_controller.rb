class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def draft
    @drafts = Campaign.drafted
  end

  def show
    @campaign = Campaign.find(params[:id])
    @user = @campaign.user
  end

  def update
    Campaign.find(params[:id]).update(status: (params[:campaign][:status]).downcase)
    return campaign_path(params[:id])
  end

end
