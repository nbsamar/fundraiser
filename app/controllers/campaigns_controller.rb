class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def draft
    @drafts = Campaign.drafted
  end

end
