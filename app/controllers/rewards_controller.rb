class RewardsController < ApplicationController
  def index
    @rewards = current_account.rewards.by_status(params[:status]).page(params[:page])
  end
end
