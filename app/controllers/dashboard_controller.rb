class DashboardController < ApplicationController
  def show
    @profile = TwitterProfileSearch.new(current_user.username).profile
    @saved_profiles = current_user.saved_profiles
  end
end
