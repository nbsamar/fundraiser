class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(name: params[:user][:name], email: params[:user][:email])
        .campaigns.create(name: params[:campaign][:name],
                          purpose: params[:campaign][:purpose],
                          amount: params[:campaign][:amount])
  end
end
