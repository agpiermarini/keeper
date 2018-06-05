class ProfilesController < ApplicationController
  def show
    @twitter_profile = TwitterProfileSearch.new(params[:username]).profile
  end
end
