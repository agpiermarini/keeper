class DashboardController < ApplicationController
  def show
    @twitter_profile = TwitterProfileSearch.new(current_user.username).profile
    @saved_profiles = current_user.saved_profiles
  end
end
